
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:offside/features/firebase_auth/data/repositories/firebase_auth_repository_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final FirebaseAuthRepositoryImpl _auth = FirebaseAuthRepositoryImpl();

  void signInEmail({required String email, required String password}) {
    emit(AuthLoading());
    _auth.signInWithEmail(email: email, password: password).then((response) {
      print(response);
      emit(AuthSuccess());
    }).catchError((error) {
      print('===> Error ===> $error');
      emit(AuthError());
    });
  }

  void signUpEmail({required String email, required String password}){
    emit(AuthLoading());
    _auth.registerWithEmail(email: email, password: password).then((response) {
      print(response);
      emit(AuthSuccess());
    }).catchError((error) {
      print('===> Error ===> $error');
      emit(AuthError());
    });
  }

  void signInFacebook(){
    emit(AuthLoading());
    _auth.signInWithFacebook().then((response){
      print(response.user);
      emit(AuthSuccess());
    }).catchError((error){
      print('===> Error ===> $error');
      emit(AuthError());
    });
  }


  void signInGoogle(){

  }
}
