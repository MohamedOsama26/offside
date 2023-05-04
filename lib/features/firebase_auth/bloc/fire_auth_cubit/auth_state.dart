part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final bool? newUser;
  AuthSuccess({this.newUser});
}
class AuthError extends AuthState {
  AuthError({required this.errorContent});
  final String errorContent;
}
