import 'package:deshi_mart/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class Exclusive extends StatelessWidget {
  const Exclusive({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        '/product_details',
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.sp,
          right: 20.sp,
        ),
        child: Container(
          width: 55.sp,
          //  height: 60.sp,
          padding: EdgeInsets.only(
            top: 20.sp,
            bottom: 15.sp,
            left: 15.sp,
            right: 15.sp,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.sp,
              ),
            ),
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/banana.png')),
              SizedBox(
                height: 20.sp,
              ),
              Text(
                'Organic Banana',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Gilroy',
                ),
              ),
              Text(
                '7pcs',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontFamily: 'Gilroy',
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$4.99',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                  IconButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          30.sp,
                          30.sp,
                        ),
                        backgroundColor: Global_Variables.main_color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              18.sp,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        size: 25.sp,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
