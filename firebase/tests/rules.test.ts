import * as fs from "fs";
import { v4 } from "uuid";
import * as _ from "lodash";
import * as firebase from "@firebase/rules-unit-testing";
import { dummyBookshelf, dummyUser } from "./dummy_data";

// dev環境のプロジェクトID
const PROJECT_ID = "pj-picbook-pro";

let testEnv: firebase.RulesTestEnvironment;

beforeAll(async () => {
  // テストプロジェクト環境の作成
  testEnv = await firebase.initializeTestEnvironment({
    projectId: PROJECT_ID,
    firestore: {
      rules: fs.readFileSync("./firestore.rules", "utf8"),
    },
  });
});

beforeEach(async () => {
  await testEnv.clearFirestore();
});

afterAll(async () => {
  await testEnv.cleanup();
});

describe("users collection", () => {
  describe("get", () => {
    test("認証が済んでいないユーザがドキュメントを読み込めないこと", async () => {
      const uid = v4();
      const context = testEnv.unauthenticatedContext();

      await firebase.assertFails(
        context.firestore().collection("users").doc(uid).get()
      );
    });

    test("認証が済んでいるユーザが自分のドキュメントを読み込めること", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertSucceeds(
        context.firestore().collection("users").doc(uid).get()
      );
    });

    test("認証が済んでいるユーザが他人のドキュメントを読み込めないこと", async () => {
      const uid = v4();
      const other = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertFails(
        context.firestore().collection("users").doc(other).get()
      );
    });
  });

  describe("create", () => {
    test("自分のユーザードキュメントを作成出来ること", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertSucceeds(
        context.firestore().collection("users").doc(uid).set(dummyUser)
      );
    });

    test("他人のユーザードキュメントに作成出来ないこと", async () => {
      const uid = v4();
      const otherUid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertFails(
        context.firestore().collection("users").doc(otherUid).set(dummyUser)
      );
    });

    test("スキーマが間違っている場合に作成できないこと", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);
      const data = _.cloneDeep(dummyUser) as any;
      delete data.id;

      await firebase.assertFails(
        context.firestore().collection("users").doc(uid).set(data)
      );
    });
  });

  describe("update", () => {
    const updatedUser = _.cloneDeepWith(dummyUser, (val) => {
      if (val === "id") {
        return "updated_id";
      }
    });

    test("自分のユーザードキュメントを変更出来ること", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);
      const db = context.firestore();
      await db.collection("users").doc(uid).set(dummyUser);

      await firebase.assertSucceeds(
        db.collection("users").doc(uid).update(updatedUser)
      );
    });

    test("他人のユーザードキュメントを変更出来ないこと", async () => {
      const uid = v4();
      const otherUid = v4();
      const context = testEnv.authenticatedContext(uid);
      const otherContext = testEnv.authenticatedContext(otherUid);
      await otherContext
        .firestore()
        .collection("users")
        .doc(otherUid)
        .set(dummyUser);

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(otherUid)
          .update(updatedUser)
      );
    });
  });
});

describe("bookshelfs subcollection", () => {
  describe("get", () => {
    test("認証が済んでいないユーザがドキュメントを読み込めないこと", async () => {
      const uid = v4();
      const context = testEnv.unauthenticatedContext();

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(uid)
          .collection("bookshelfs")
          .get()
      );
    });

    test("認証が済んでいるユーザが自分のドキュメントを読み込めること", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertSucceeds(
        context
          .firestore()
          .collection("users")
          .doc(uid)
          .collection("bookshelfs")
          .get()
      );
    });

    test("認証が済んでいるユーザが他人のドキュメントを読み込めないこと", async () => {
      const uid = v4();
      const other = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(other)
          .collection("bookshelfs")
          .get()
      );
    });
  });

  describe("create", () => {
    test("自分のbookshelfsドキュメントを作成出来ること", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertSucceeds(
        context
          .firestore()
          .collection("users")
          .doc(uid)
          .collection("bookshelfs")
          .doc()
          .set(dummyBookshelf)
      );
    });

    test("他人のbookshelfsドキュメントに作成出来ないこと", async () => {
      const uid = v4();
      const otherUid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(otherUid)
          .collection("bookshelfs")
          .doc()
          .set(dummyBookshelf)
      );
    });
  });

  describe("update", () => {
    const updatedBookshelf = _.cloneDeep(dummyBookshelf);
    updatedBookshelf.id = "updated_id";

    test("自分のbookshelfsドキュメントを変更出来ること", async () => {
      const uid = v4();
      const documentId = v4();
      const context = testEnv.authenticatedContext(uid);
      const db = context.firestore();
      await db
        .collection("users")
        .doc(uid)
        .collection("bookshelfs")
        .doc(documentId)
        .set(dummyBookshelf);

      await firebase.assertSucceeds(
        db
          .collection("users")
          .doc(uid)
          .collection("bookshelfs")
          .doc(documentId)
          .update(updatedBookshelf)
      );
    });

    test("他人のboolshelfsドキュメントを変更出来ないこと", async () => {
      const uid = v4();
      const otherUid = v4();
      const documentId = v4();
      const context = testEnv.authenticatedContext(uid);
      const otherContext = testEnv.authenticatedContext(otherUid);
      await otherContext
        .firestore()
        .collection("users")
        .doc(otherUid)
        .collection("bookshelfs")
        .doc(documentId)
        .set(dummyBookshelf);

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(otherUid)
          .collection("bookshelfs")
          .doc(documentId)
          .update(updatedBookshelf)
      );
    });
  });
});
