import 'dart:ui';

import 'package:deshi_mart/common/widgets/custom_button.dart';
import 'package:deshi_mart/common/widgets/custom_textfield.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/onboard/screen/onboard.dart';
import 'package:deshi_mart/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
        child: Stack(
          children: [
            Padding(
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
                          if (_formKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(OnSignInRequested(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ));
                          }
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
                                //  color: Colors.green,
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
            BlocConsumer<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is Loading) {
                  // showDialog(
                  //   context: context,
                  //   builder: (context) => Dialog(),
                  // );
                  return Stack(
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.w,
                        color: Colors.grey.withOpacity(.5),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: Global_Variables.main_color,
                          size: 35.sp,
                        ),
                      ),
                    ],
                  );
                  //  return const CircularProgressIndicator.adaptive();
                }
                return const SizedBox.shrink();
              },
              listener: (context, state) {
                if (state is Failure) {
                  print(state.error);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              20.sp,
                            ),
                            topRight: Radius.circular(
                              20.sp,
                            )),
                      ),
                      content: Text(
                        state.error,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                } else if (state is Success) {
                  context.go('/bottom_bar');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
