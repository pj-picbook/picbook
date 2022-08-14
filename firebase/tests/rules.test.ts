import * as fs from "fs";
import { v4 } from "uuid";
import * as firebase from "@firebase/rules-unit-testing";
import { serverTimestamp as st, setDoc, updateDoc } from "firebase/firestore";
const serverTimestamp = () => st();

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
        context
          .firestore()
          .collection("users")
          .doc(uid)
          .set({ name: "test_user" })
      );
    });

    test("他人のユーザードキュメントに作成出来ないこと", async () => {
      const uid = v4();
      const otherUid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(otherUid)
          .set({ name: "test_user" })
      );
    });

    test("nameフィールドがない時にのユーザードキュメントを作成出来ないこと", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(uid)
          .set({ hoge: "test_user" })
      );
    });

    test("スキーマが間違っている場合に作成できないこと", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(uid)
          .set({ name: "test_user", hoge: "hoge" })
      );
    });
  });

  describe("update", () => {
    test("自分のユーザードキュメントを変更出来ること", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);
      const db = context.firestore();
      await db.collection("users").doc(uid).set({ name: "test_user" });

      await firebase.assertSucceeds(
        db.collection("users").doc(uid).update({ name: "test_user" })
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
        .set({ name: "test_user" });

      await firebase.assertFails(
        context
          .firestore()
          .collection("users")
          .doc(otherUid)
          .update({ name: "test_user" })
      );
    });

    test("nameフィールドがない時にユーザードキュメントを変更出来ないこと", async () => {
      const uid = v4();
      const context = testEnv.authenticatedContext(uid);
      const db = context.firestore();
      db.collection("users").doc(uid).set({ name: "test_user" });

      await firebase.assertFails(
        db.collection("users").doc(uid).update({ hoge: "test_user" })
      );
    });
  });
});
