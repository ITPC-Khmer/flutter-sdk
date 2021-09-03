import 'package:flutter/widgets.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  Status status = Status.Uninitialized;
   late User user;

  Future<bool> signIn(String email, String password) async {
    try {
      status = Status.Authenticating;
      notifyListeners();
      return true;
    } catch (e) {
      status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      status = Status.Authenticating;
      notifyListeners();
     
      return true;
    } catch (e) {
      print(e);
      status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }

  }

  Future signOut() async {
    status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

}

class User{
  late String id;
  late String name;
  late String email;
}
