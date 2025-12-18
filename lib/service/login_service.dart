import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'bahlil' && password == 'etanol') {
      await UserInfo().setToken("bahlil");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("etanol");
      isLogin = true;
    }
    return isLogin;
  }
}
