part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class Success extends SignInState {
  final User user;

  Success({required this.user});
}

final class Failure extends SignInState {
  final String error;

  Failure(this.error);
}

final class Loading extends SignInState {}
