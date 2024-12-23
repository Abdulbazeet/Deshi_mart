// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:deshi_mart/common/widgets/custom_button.dart';
import 'package:deshi_mart/common/widgets/custom_textfield.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _obscure = true;
  bool? _emailVal;
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
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text(
                    'Enter your credentials to continue',
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 16.sp,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  CustomTextField(
                    controller: _nameController,
                    label: 'Username',
                    hide: false,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    hide: false,
                    e: true,
                    emailVal: _emailVal,
                    onChanged: (value) {
                      setState(() {
                        if (value.contains('@') && value.contains('.com')) {
                          _emailVal = true;
                        } else {
                          _emailVal = false;
                        }
                      });
                    },
                    icon: _emailVal != null
                        ? _emailVal == true
                            ? const Icon(
                                Icons.check,
                                color: Color(0xfff53B175),
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                              )
                        : const SizedBox.shrink(),
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By continuing, you agree to our ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Gilroy',
                            fontSize: 16.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: const Color(0xfff53B175),
                            fontFamily: 'Gilroy',
                            fontSize: 16.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' and',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Gilroy',
                            fontSize: 16.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(
                            color: const Color(0xfff53B175),
                            fontFamily: 'Gilroy',
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
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
                        "Already have an account?",
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
                            () => context.go('/sign_in'),
                          );
                        },
                        child: Text(
                          'Sign in',
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
