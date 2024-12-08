import 'package:deshi_mart/constants/global_variables.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class DeshiColumn extends StatelessWidget {
  const DeshiColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
        vertical: 30.sp,
      ).copyWith(top: 30.sp),
     // height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            15.sp,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.sp,
          ),
          SizedBox(
            width: double.infinity,
            //  height: 50.sp,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Group 5.png',
                  // height: 50.sp,
                  // width: 10.sp,
                ),
                Expanded(
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'DESHI ',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Global_Variables.main_color),
                            ),
                            TextSpan(
                              text: 'MART',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Desh ka  market',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/Vector.png',
              ),
              SizedBox(
                width: 15.sp,
              ),
              Expanded(
                child: Text(
                  'Organic Groceries',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              var l = (constraints.maxWidth / 4.15).floor();
              print(l);
              return Row(
                //  direction: Axis.horizontal,

                children: List.generate(
                  l,
                  (index) => const Text(
                    '-',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/Vector (1).png',
              ),
              SizedBox(
                width: 15.sp,
              ),
              Expanded(
                child: Text(
                  'Whole food and vegetables',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              var l = (constraints.maxWidth / 4.15).floor();
              print(l);
              return Row(
                //  direction: Axis.horizontal,

                children: List.generate(
                  l,
                  (index) => const Text(
                    '-',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/Group.png',
              ),
              SizedBox(
                width: 15.sp,
              ),
              Expanded(
                child: Text(
                  'Fast Delivery',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              var l = (constraints.maxWidth / 4.15).floor();
              print(l);
              return Row(
                //  direction: Axis.horizontal,

                children: List.generate(
                  l,
                  (index) => const Text(
                    '-',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/Vector (2).png',
              ),
              SizedBox(
                width: 15.sp,
              ),
              Expanded(
                child: Text(
                  'East refund and Return',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              var l = (constraints.maxWidth / 4.15).floor();
              print(l);
              return Row(
                //  direction: Axis.horizontal,

                children: List.generate(
                  l,
                  (index) => const Text(
                    '-',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/Vector (3).png',
              ),
              SizedBox(
                width: 15.sp,
              ),
              Expanded(
                child: Text(
                  'Secure and safe',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
