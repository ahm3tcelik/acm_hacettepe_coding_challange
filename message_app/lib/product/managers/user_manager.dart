import '../models/fake_data.dart';
import '../models/user_model.dart';

class UserManager implements IUserManager {

  @override
  User? currentUser = users[0]; // SET FAKE DATA

}
abstract class IUserManager {
  User? currentUser;
}