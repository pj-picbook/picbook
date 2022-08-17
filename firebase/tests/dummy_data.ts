export interface User {
  id: string;
  email: string;
  linkedAccount: string;
}
export const dummyUser: User = {
  id: "test_uid",
  email: "test@example.com",
  linkedAccount: "Google",
};
