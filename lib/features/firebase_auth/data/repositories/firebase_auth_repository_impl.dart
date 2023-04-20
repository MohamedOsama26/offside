import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
      );
    } on FirebaseAuthException catch (e) {
      print('Error => ${e.code}');
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
    final UserCredential credential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    return Response(user: credential.user);
  }

  @override
  Future<Response> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
