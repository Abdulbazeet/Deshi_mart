import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Advert extends StatefulWidget {
  const Advert({super.key});

  @override
  State<Advert> createState() => _AdvertState();
}

class _AdvertState extends State<Advert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sp,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.sp,
          ),
        ),
      ),
      child: PageView(),
    );
  }
}
