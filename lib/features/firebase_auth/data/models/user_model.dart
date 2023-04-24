import 'user_metadata.dart';

class UserModel {
  UserModel({
    required this.uid,
    required this.email,
    required this.isAnonymous,
    required this.name,
    required this.emailVerified,
    required this.phoneNumber,
    required this.photoURL,
    required this.facebookId,
    required this.userMetaData,
  });
  final String uid;
  final String email;
  final bool isAnonymous;
  final String name;
  final bool emailVerified;
  final String phoneNumber;
  final String photoURL;
  final String facebookId;
  final UserMetadata userMetaData;

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      uid: map['uid'],
      isAnonymous: map['isAnonymous'],
      name: map['name'],
      emailVerified: map['emailVerified'],
      phoneNumber: map['phoneNumber'],
      photoURL: map['photoURL'],
      facebookId: map['facebookId'],
      userMetaData: map['userMetaData'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
        'emailVerified': emailVerified,
        'isAnonymous': isAnonymous,
        'phoneNumber': phoneNumber,
        'photoURL': photoURL,
        'facebookId': facebookId,
        'userMetaData': userMetaData,
      };
}
