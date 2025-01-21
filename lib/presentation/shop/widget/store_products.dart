import 'package:deshi_mart/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class Exclusive extends StatelessWidget {
  final String name;
  final String price;
  final String discountedPrice;
  final int quantity;

  const Exclusive(
      {super.key,
      required this.name,
      required this.price,
      required this.quantity,
      required this.discountedPrice});

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
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Gilroy',
                ),
              ),
              Text(
                '${quantity}pcs',
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
                  Column(
                    children: [
                      Text(
                        '\$$discountedPrice',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                      Text(
                        '\$$price',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
