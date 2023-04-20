import 'package:firebase_auth/firebase_auth.dart';

class Response {
  final User? user;
  final String? message;

  Response({this.user,this.message});

// if (e.code == 'user-not-found') {
// 	Response(message: 'No user found for that email.');
// } else if (e.code == 'wrong-password') {
// 	return Response(message: 'Wrong password provided for that user.');
// }

  // if (e.code == 'weak-password') {
  // print('The password provided is too weak.');
  // } else if (e.code == 'email-already-in-use') {
  // print('The account already exists for that email.');
  // }

dynamic handledResponse (){
  print('user => $user');
  if(user != null) {
    return user?.uid.toString();
  } else if(message == 'email-already-in-use') {
    print('---> Error message : $message');
    return message;
  }
}

}