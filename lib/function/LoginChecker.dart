import 'package:shared_preferences/shared_preferences.dart';

class LoginChecker {
  bool existingLoginState = false;

  Future<dynamic> isExisting() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();

        existingLoginState = prefs.getBool('loginExist');
        if(existingLoginState == true){
          return true;
        }
        return false;
    }catch(exception){
      print('Exception Fount in Preferences +++'+exception);
      return false;
    }
  }
}
