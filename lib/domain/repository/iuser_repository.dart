import 'package:admin_pannel/data/model/user/user_model.dart';

abstract interface class IUserRepository {
  Stream<List<UserModel>> getRealTimeStreamData();

  Future<List<UserModel>?> getUser();

  Future<UserModel?> getUserById(String email);
}
