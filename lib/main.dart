import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/constants/routes.dart';
import 'package:deshi_mart/presentation/onboard/screen/onboard.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          splashColor: Colors.transparent,
          colorScheme: const ColorScheme.light(
            primary: Global_Variables.main_color,
          ),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
