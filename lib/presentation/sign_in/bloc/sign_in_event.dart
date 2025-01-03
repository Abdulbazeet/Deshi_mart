part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

final class OnSignInRequested extends SignInEvent {
  final String email;
  final String password;

  OnSignInRequested({required this.email, required this.password});
}
