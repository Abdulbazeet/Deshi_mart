import 'package:deshi_mart/common/widgets/custom_button.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/onboard/screen/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int? maxLine = 1;
  bool rate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: IconButton(
          onPressed: () => context.go('/bottom_bar'),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    20.sp,
                  ),
                  bottomRight: Radius.circular(
                    20.sp,
                  ),
                ),
                color: Colors.grey.shade200,
              ),
              child: Image.asset('assets/images/apple.png'),
            ),
            Expanded(
              child: Container(
                //    height: 50.h,
                padding: EdgeInsets.all(
                  20.sp,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Red Apples',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '1kg',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Gilroy',
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  color: Global_Variables.main_color,
                                  size: 20.sp,
                                ),
                              ),
                              IconButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                    30.sp,
                                    30.sp,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        18.sp,
                                      ),
                                    ),
                                    side: BorderSide(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                icon: Text(
                                  '1',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Global_Variables.main_color,
                                  size: 20.sp,
                                ),
                              )
                            ],
                          ),
                          Text(
                            '\$4.99',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Details',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 17.sp,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  maxLine = maxLine == 1 ? null : 1;
                                },
                              );
                              print(maxLine);
                            },
                            icon: maxLine == 1
                                ? Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 20.sp,
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 23.sp,
                                  ),
                          )
                        ],
                      ),
                      Text(
                        'Apples are nutritous, Apples may be good for weight loss. Apples may be good for your heart. It should be a part of your diet everyday',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 16.sp,
                          color: Colors.grey,
                        ),
                        maxLines: maxLine,
                        overflow: maxLine == 1 ? TextOverflow.ellipsis : null,
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Divider(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Review',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 17.sp,
                            ),
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                ignoreGestures: true,
                                onRatingUpdate: (value) {
                                  null;
                                },
                                itemSize: 20.sp,
                                initialRating: 2,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      rate = !rate;
                                    },
                                  );
                                  print(maxLine);
                                },
                                icon: rate
                                    ? Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 20.sp,
                                      )
                                    : Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 23.sp,
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      rate == true
                          ? Center(
                              child: RatingBar.builder(
                                onRatingUpdate: (value) {},
                                // itemSize: 20.sp,
                                // glowColor: Colors.orange,
                                minRating: 0,
                                initialRating: 2,

                                maxRating: 5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                        height: 20.sp,
                      ),
                      CustomButton(
                        text: 'Add To Cart',
                        onPressed: () {},
                        color: Global_Variables.main_color,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
