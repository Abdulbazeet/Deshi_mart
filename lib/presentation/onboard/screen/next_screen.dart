import 'package:deshi_mart/common/widgets/custom_button.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/onboard/widgets/deshi_column.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

enum ExplorePage {
  mainCategory,
  productSearch,
}

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  void showDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 25.h,
              padding: EdgeInsets.symmetric(
                horizontal: 15.sp,
                vertical: 20.sp,
              ),
              child: Column(
                children: [
                  CustomButton(
                    text: 'SIGN IN',
                    color: Global_Variables.main_color,
                    onPressed: () {
                      Router.neglect(
                        context,
                        () => context.go('/sign_in'),
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  CustomButton(
                    text: 'SIGN UP',
                    color: Global_Variables.main_color,
                    onPressed: () {
                      Router.neglect(
                        context,
                        () => context.go('/sign_up'),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global_Variables.main_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
              vertical: 20.sp,
            ),
            child: Column(
              children: [
                const DeshiColumn(),
                SizedBox(
                  height: 20.sp,
                ),
                Text(
                  'Welcome to our store',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Get your grocery in as fast as \n one hour',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 17.sp,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                CustomButton(
                  onPressed: showDialog,
                  text: 'NEXT',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
