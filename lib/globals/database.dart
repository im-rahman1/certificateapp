import 'package:certificateapp/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static FirebaseFirestore instance = FirebaseFirestore.instance;
  // static String userId = FirebaseAuth.instance.currentUser!.uid;

  static createUserInDatabase(UserModel user) async {
    // FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    // var token = await firebaseMessaging.getToken() ?? '';
    return await instance
        .collection('users')
        .doc(user.id)
        .set({...user.toMapSignup()}).then((value) {
      return true;
    }).catchError((e) {
      return false;
    });
  }

  static Future<UserModel?> getUser(String uid) async {
    DocumentSnapshot doc = await instance.collection("users").doc(uid).get();
    return UserModel.fromDocumentSnapshot(doc);
  }

  static Future<bool> isUserExist(String email) async {
    var docs = await instance
        .collection("users")
        .where('email', isEqualTo: email)
        .get();
    return docs.docs.isNotEmpty;
  }
}
