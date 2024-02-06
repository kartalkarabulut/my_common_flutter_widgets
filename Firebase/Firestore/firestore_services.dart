import 'package:ai_voice_app/models/auth-register-login/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future saveUserData(UserModel user) async {
    try {
      var userCollection = firebaseFirestore.collection("users");
      await userCollection.doc(user.userid).set(user.toJson());
    } catch (e) {}
  }
}
