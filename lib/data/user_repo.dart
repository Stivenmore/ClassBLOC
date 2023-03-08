class UserRepo {
  Future<bool> login({required String user, required String pass}) async {
    try {
      Future.delayed(const Duration(seconds: 2));
      if (user == 'SUPER' && pass == '123') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
