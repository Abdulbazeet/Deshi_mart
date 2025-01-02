part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

final class OnSignUpRequested extends SignUpEvent {
  final String name;
  final String email;
  final String password;

  OnSignUpRequested(
      {required this.name, required this.email, required this.password});
}
