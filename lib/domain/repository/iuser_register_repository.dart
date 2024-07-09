abstract class IUserRegisterRepository {
  Future<void> registerUser(String email, String password);
}
