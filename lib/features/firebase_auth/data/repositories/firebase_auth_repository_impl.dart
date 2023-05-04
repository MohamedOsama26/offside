import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:offside/features/firebase_auth/data/models/response_model.dart';
import 'package:offside/features/firebase_auth/domain/repositories/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl extends FirebaseAuthRepository {
  FirebaseAuthRepositoryImpl();

  @override
  Future<Response> registerWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Response(
        user: credential.user,
        newUser: true,
      );
    } on FirebaseAuthException catch (e) {
      return Response(
        message: e.code,
      );
    }
  }

  @override
  Future<Response> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Response(
        user: credential.user,
      );
    } on FirebaseAuthException catch (e) {
      return Response(
        message: e.code,
      );
    }
  }

  @override
  Future<Response> signInWithFacebook() async {

    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    final UserCredential credential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    return Response(user: credential.user,newUser:credential.additionalUserInfo?.isNewUser);
  }

  @override
  Future<Response> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //Signed In
    UserCredential generatedCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // return Response
    return Response(user: generatedCredential.user,newUser: generatedCredential.additionalUserInfo?.isNewUser);
  }

  @override
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}
