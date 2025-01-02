// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'dart:ui';

import 'package:deshi_mart/common/widgets/custom_button.dart';
import 'package:deshi_mart/common/widgets/custom_textfield.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
                          if (_formKey.currentState!.validate()) {
                            context.read<SignUpBloc>().add(
                                  OnSignUpRequested(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
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
            BlocConsumer<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is Loading) {
                  // showDialog(
                  //   context: context,
                  //   builder: (context) => Dialog(),
                  // );
                  return Container(
                    height: 100.h,
                    width: 100.w,
                    color: Colors.grey.withOpacity(.5),
                    child: Center(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(),
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Global_Variables.main_color,
                            size: 35.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                  //  return const CircularProgressIndicator.adaptive();
                }
                return const SizedBox.shrink();
              },
              listener: (context, state) {
                if (state is Failure) {
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
                      content: const Text(
                        'Account created successfully, login with credentials',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                  context.go('/sign_in');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
