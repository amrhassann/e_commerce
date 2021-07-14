import 'package:e_commerce/core/services/firestore_user.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email,password , name;
  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // ignore: non_constant_identifier_names
  void googleSignInMethod() async {
    // 1-> to sign in with google
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // -> to get idToken And accessToken from googleUser
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    // -> to get (authCredential) >.. you need idToken And accessToken
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    //2 -> to add account in firebaseAuth >..... you need (authCredential)
    await _auth.signInWithCredential(authCredential).then((user) {
      saveUser(user);
      Get.offAll(HomePage());
    });
  }


  void signInWithEmailAndPass()async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  void createAccountWithEmailAndPass()async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) {
      saveUser(user);
      Get.offAll(HomePage());

    });
  }

  void saveUser(UserCredential user)async{
    await FireStoreUser().addUserToFireStore(
      UserModel(
      name: name==null? user.user.displayName: name,
      email: user.user.email,
      userId: user.user.uid,
      pic: user.user.photoURL,
    ));
  }

}
