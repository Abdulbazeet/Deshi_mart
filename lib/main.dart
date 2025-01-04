import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/constants/routes.dart';
import 'package:deshi_mart/constants/shared.dart';
import 'package:deshi_mart/presentation/onboard/screen/onboard.dart';
import 'package:deshi_mart/presentation/shop/bloc/shop_bloc.dart';
import 'package:deshi_mart/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:deshi_mart/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final String token = await Shared.getToken();
  String initialRoute = token.isNotEmpty ? '/bottom_bar' : '/';
  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignUpBloc(),
          ),
          BlocProvider(
            create: (context) => SignInBloc(),
          ),
          BlocProvider(
            create: (context) => ShopBloc(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            splashColor: Colors.transparent,
            colorScheme: const ColorScheme.light(
              primary: Global_Variables.main_color,
            ),
            useMaterial3: true,
          ),
          routerConfig: router(initialRoute),
        ),
      ),
    );
  }
}
