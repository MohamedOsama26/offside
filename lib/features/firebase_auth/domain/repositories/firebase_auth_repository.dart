import 'package:offside/features/firebase_auth/data/models/response_model.dart';

abstract class FirebaseAuthRepository {
  Future<Response> registerWithEmail({required String email, required String password});

  Future<Response> signInWithEmail({required String email, required String password});

  Future<Response> signInWithGoogle();

  Future<Response> signInWithFacebook();

  Future<void> signOut();

}
