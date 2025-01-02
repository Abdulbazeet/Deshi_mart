part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class Success extends SignUpState {}

final class Loading extends SignUpState {}

final class Failure extends SignUpState {
  final String error;

  Failure(this.error);
}
