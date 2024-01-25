import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String id;
  late String fname;
  late String lname;
  late String email;
  late String image;
  late bool emailVerified;

  UserModel({
    required this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.image,
    required this.emailVerified,
  });

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    try {
      id = doc.id;
      var data = doc.data() as Map; // Ensure the type is correct
      fname = data?['fname'] ?? '';
      lname = data?['lname'] ?? '';
      email = data?['email'] ?? '';
      image = data?['image'] ?? '';
      emailVerified =
          data?['emailVerified'] ?? false; // Ensure the correct type
    } catch (e) {
      print("Error parsing UserModel: $e");
      // Handle the exception as needed
    }
  }

  Map<String, dynamic> toMap() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "image": image,
        "emailVerified": emailVerified
      };
  Map<String, dynamic> toMapSignup() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "image": image,
        "emailVerified": emailVerified,
        "createdAt": Timestamp.now(),
      };
}
