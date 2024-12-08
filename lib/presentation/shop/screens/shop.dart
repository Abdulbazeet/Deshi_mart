import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/shop/widget/advert.dart';
import 'package:deshi_mart/presentation/shop/widget/store_products.dart';
import 'package:deshi_mart/presentation/shop/widget/groceries.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            20.sp,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/carrot.png',
                    height: 25.sp,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                        ),
                        Text(
                          'Dhaka, Banassre',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  //   const Spacer(),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      15.sp,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search store',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Global_Variables.main_color,
                        size: 22.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  //  physics: FixedExtentScrollPhysics(),
                  // primary: true,
                  child: Column(
                    children: [
                      Advert(),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Exclusive Offer',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              //   fontWeight: FontWeight.w300,
                              fontSize: 16.sp,
                              color: Global_Variables.main_color,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      SizedBox(
                        height: 70.sp,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            Exclusive(),
                            Exclusive(),
                            Exclusive(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Best Selling',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              //   fontWeight: FontWeight.w300,
                              fontSize: 16.sp,
                              color: Global_Variables.main_color,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      SizedBox(
                        height: 70.sp,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            Exclusive(),
                            Exclusive(),
                            Exclusive(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Groceries',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              //   fontWeight: FontWeight.w300,
                              fontSize: 16.sp,
                              color: Global_Variables.main_color,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      SizedBox(
                      //  width: 70.sp,
                        height: 40.sp,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children:  [
                            Groceries(),
                            Groceries(),
                            Groceries(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
