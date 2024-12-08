import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget? icon;
  final bool hide;
  bool? emailVal;
  bool? e;
  final TextEditingController controller;
  final Function(String)? onChanged;

  CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hide,
    this.icon,
    this.emailVal,
    this.e,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      // onFieldSubmitted: (value) {
      //   if (widget.e == true) {
      //     if (!(value.contains('@')) && !(value.contains('.com'))) {
      //       setState(() {
      //         widget.emailVal = false;
      //       });
      //     } else if (value.contains('@') && value.contains('.com')) {
      //       setState(() {
      //         widget.emailVal = true;
      //       });
      //     }
      //   }
      // },
      // onSaved: (newValue) {
      //    if (widget.e == true) {
      //     if (!(newValue.contains('@')) && !(value.contains('.com'))) {
      //       setState(() {
      //         widget.emailVal = false;
      //       });
      //     } else if (value.contains('@') && value.contains('.com')) {
      //       setState(() {
      //         widget.emailVal = true;
      //       });
      //     }
      //   }
      // },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.sp,
        ).copyWith(top: 0),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18.sp,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: icon,
      ),
      obscureText: hide,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your ${label}';
        }
      },
    );
  }
}
