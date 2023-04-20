class User {
  User({required this.uid,required this.email});
  final String uid;
  final String email;

  factory User.fromJson(Map<String,dynamic> map){
    return User(email: map['email'],uid: map['uid']);
  }

  Map<String, dynamic> toJson(User user){
    return{
      uid: user.uid,
      email: user.email
    };
  }
}