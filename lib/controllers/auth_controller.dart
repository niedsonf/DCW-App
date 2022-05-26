import 'package:getmage/routing/routes.dart';
import 'package:getmage/services/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:getmage/helpers/constants.dart';
import 'package:getmage/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Status { Authenticated, Unauthenticated }

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late User _user;
  Status _status = Status.Unauthenticated;
  UserServices _userServices = UserServices();

  late UserModel _userModel;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  UserModel get userModel => _userModel;
  Status get status => _status;
  User get user => _user;

  AuthController.init() {
    _fireSetUp();
  }

  _fireSetUp() async {
    await initialization.then((value) => () {
          auth.authStateChanges().listen((user) {
            _onStateChanged(user);
          });
        });
  }

  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await auth.signInWithCredential(credential).then((userCredentials) async {
        _user = userCredentials.user!;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', _user.uid);
        if (!await _userServices.doesUserExist(_user.uid)) {
          _userServices.createUser(
              id: _user.uid, name: _user.displayName, photo: _user.photoURL);
          await initializeUserModel();
        } else {
          await initializeUserModel();
        }
      });
      return {'success': true, 'message': 'success'};
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<bool> initializeUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _userId = preferences.getString('id')!;
    _userModel = await _userServices.getUserById(_userId);
    if (_userModel == null) {
      return false;
    } else {
      _status = Status.Authenticated;
      return true;
    }
  }

  void signOut() async {
    auth.signOut();
    _status = Status.Unauthenticated;
    Get.offAllNamed(RootRoute);
  }

  _onStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      initializeUserModel();
      _status = Status.Authenticated;
    }
  }
}
