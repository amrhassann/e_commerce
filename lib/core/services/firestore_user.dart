import 'package:e_commerce/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUser {
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel user)async{
    return await _userCollectionReference.doc(user.userId).set(user.toJson());
  }
}
