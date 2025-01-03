import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<OnSignInRequested>(_signInRequested);
  }

  Future<void> _signInRequested(
      OnSignInRequested event, Emitter<SignInState> emit) async {
    final connectionResult = await Connectivity().checkConnectivity();
    if (connectionResult == ConnectivityResult.none) {
      emit(
        Failure('There is no internet connection'),
      );
    }
    emit(
      Loading(),
    );
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/auth_signIn"),
        body: jsonEncode(
          {
            "email": event.email,
            "password": event.password,
          },
        ),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      switch (res.statusCode) {
        case 200:
          print(jsonDecode(res.body));
          User user = User(
              name: '', email: '', id: '', password: '', type: '', token: '');
          user = User.fromMap(jsonDecode(res.body));
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(
            "authToken",
            jsonDecode(res.body)['token'],
          );
          emit(
            Success(user: user),
          );
          break;
        case 400:
          emit(
            Failure(
              jsonDecode(res.body)['msg'],
            ),
          );
          break;
        case 500:
          emit(
            Failure(
              jsonDecode(res.body)['error'],
            ),
          );
          break;
        default:
      }
    } catch (e) {
      print(e);
      emit(
        Failure(
          e.toString(),
        ),
      );
    }
  }
}
