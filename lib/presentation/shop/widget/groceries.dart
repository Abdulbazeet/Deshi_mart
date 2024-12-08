import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Groceries extends StatelessWidget {
  const Groceries({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20.sp,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.sp,
        ),
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.sp,
            ),
          ),
          color: Color(
            0xfffF8A44C,
          ).withOpacity(.3),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/pizza.png',
            ),
            SizedBox(
              width: 20.sp,
            ),
            Text(
              'Pulses',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black87,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
