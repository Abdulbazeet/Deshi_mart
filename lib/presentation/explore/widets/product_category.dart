import 'dart:math';

import 'package:deshi_mart/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  final Random _random = Random();
  Color _color = Global_Variables.main_color.withOpacity(.1);

  Color _newColor() {
    setState(() {
      _color = Color(
        _random.nextInt(
          0xFFFFFF,
        ),
      );
    });
    return _color;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newColor();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: _color.withOpacity(.1),
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.sp,
            ),
          ),
          border: Border.all(
            color: _color.withOpacity(.7),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.sp,
            ),
            Image.asset(
              'assets/images/vegetable.png',
            ),
            SizedBox(
              height: 15.sp,
            ),
            Text(
              'Fresh Fruits & Vegetables',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
