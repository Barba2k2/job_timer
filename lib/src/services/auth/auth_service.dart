abstract interface class AuthService {
  Future<void> singIn();
  Future<void> singOut();
}
