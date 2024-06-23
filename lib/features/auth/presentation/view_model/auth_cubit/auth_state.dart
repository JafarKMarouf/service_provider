part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel userModel;

  const AuthSuccess({
    required this.userModel,
  });
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  const AuthFailure({
    required this.errorMessage,
  });
}

final class AuthVisible extends AuthState {}

final class AuthInVisible extends AuthState {}

final class AuthStartTimer extends AuthState {}

final class AuthUpdateTimer extends AuthState {}

final class AuthCancelTimer extends AuthState {}

final class AuthStoredEmailVerify extends AuthState {}
