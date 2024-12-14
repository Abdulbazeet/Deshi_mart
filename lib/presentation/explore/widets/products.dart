import 'package:deshi_mart/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        15.sp,
      ),
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.sp,
          ),
        ),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/egg_red_chicken.png',
              height: 40.sp,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            'Egg Basket Red',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 10.sp,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$1.99',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16.sp,
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
    );
  }
}
