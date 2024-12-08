import 'package:deshi_mart/common/widgets/custom_button.dart';
import 'package:deshi_mart/common/widgets/custom_textfield.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/onboard/screen/onboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/Group (1).png',
                    ),
                  ),
                  SizedBox(
                    height: 40.sp,
                  ),
                  Text(
                    'Log In',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text(
                    'Enter your email and password',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16.sp,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    hide: false,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    hide: _obscure,
                    icon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                        print(_obscure);
                      },
                      icon: _obscure == true
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Gilroy',
                          fontSize: 16.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  CustomButton(
                    text: 'Log in',
                    onPressed: () {
                      Router.neglect(
                        context,
                        () => context.go('/bottom_bar'),
                      );
                    },
                    color: Global_Variables.main_color,
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 16.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Router.neglect(
                            context,
                            () => context.go('/sign_up'),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            //  color: Colors.black,
                            fontFamily: 'Gilroy',
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
