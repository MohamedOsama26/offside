import 'package:firebase_auth/firebase_auth.dart';

class Response {
  final User? user;
  final String? message;
  final bool? newUser;
  Response({this.user,this.message,this.newUser});


dynamic handledResponse (){
  if(user != null) {
    return user?.uid.toString();
  } else if(message == 'email-already-in-use') {
    return message;
  }
}

}