import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offside/features/firebase_auth/data/repositories/firebase_auth_repository_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final FirebaseAuthRepositoryImpl _auth = FirebaseAuthRepositoryImpl();

  void signInEmail({required String email, required String password}) {
    emit(AuthLoading());
    _auth.signInWithEmail(email: email, password: password).then((response) {
      if (response.user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(errorContent: response.message!));
      }
    }).catchError((error) {
      emit(AuthError(errorContent: error));
    });
  }

  void signUpEmail({required String email, required String password}) {
    emit(AuthLoading());
    _auth.registerWithEmail(email: email, password: password).then((response) {
      if (response.user != null) {
        emit(AuthSuccess(newUser: response.newUser));
      } else {
        emit(AuthError(errorContent: response.message!));
      }
    }).catchError((error) {
      emit(AuthError(errorContent: error));
    });
  }

  void signInFacebook() {
    emit(AuthLoading());
    _auth.signInWithFacebook().then((response) {
      if (response.user != null) {
        emit(AuthSuccess(newUser: response.newUser));
      } else {
        emit(AuthError(errorContent: response.message!));
      }
    }).catchError((error) {
      emit(AuthError(errorContent: error));
    });
  }

  void signInGoogle() {
    emit(AuthLoading());
    _auth.signInWithGoogle().then((response) {
      if (response.user != null) {
        emit(AuthSuccess(newUser: response.newUser));
      } else {
        emit(AuthError(errorContent: response.message!));
      }
    }).catchError((error) {
      emit(AuthError(errorContent: error.message));
    });
  }

  void signOut() {
    emit(AuthLoading());
    _auth.signOut().then((_) {
      emit(AuthSuccess(newUser: true));
    }).catchError((error) {
      emit(AuthError(errorContent: error));
    });
  }


}
