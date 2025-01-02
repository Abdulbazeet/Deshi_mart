import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'package:deshi_mart/constants/global_variables.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnSignUpRequested>(_signUpRequested);
  }

  Future<void> _signUpRequested(
      OnSignUpRequested event, Emitter<SignUpState> emit) async {
    try {
      emit(
        Loading(),
      );
      http.Response res = await http.post(
        Uri.parse("$uri/auth_signUp"),
        body: jsonEncode(
          {
            "email": event.email,
            "name": event.name,
            "password": event.password
          },
        ),
      );
      if (res.statusCode == 200) {
        emit(
          Success(),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
