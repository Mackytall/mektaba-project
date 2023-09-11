class LocalStorage {
  String token;
  String userId;

  LocalStorage({
    required this.token,
    required this.userId,
  });
}

LocalStorage localStorage = LocalStorage(token: "token", userId: "userId");
