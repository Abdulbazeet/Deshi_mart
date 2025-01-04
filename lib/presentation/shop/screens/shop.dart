import 'package:deshi_mart/common/widgets/product_shimmer.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/shop/bloc/shop_bloc.dart';
import 'package:deshi_mart/presentation/shop/widget/advert.dart';
import 'package:deshi_mart/presentation/shop/widget/store_products.dart';
import 'package:deshi_mart/presentation/shop/widget/groceries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  getExclusiveOffer() {
    context.read<ShopBloc>().add(ShowExclusiveOffer());
  }

  @override
  void initState() {
    super.initState();
    getExclusiveOffer();
  }

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
                          child: BlocConsumer<ShopBloc, ShopState>(
                            builder: (context, state) {
                              if (state is Loading) {
                                return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade600,
                                    highlightColor: Colors.grey.shade300,
                                    child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Container(
                                            color: Colors.grey,
                                            child: ProductShimmer()),
                                        ProductShimmer(),
                                        ProductShimmer(),
                                        ProductShimmer()
                                      ],
                                    ));
                              }
                              if (state is Success) {
                                return ListView.builder(
                                  itemCount: state.productModel.length,
                                  itemBuilder: (context, index) => Exclusive(
                                    name: state.productModel[index].name,
                                    price:
                                        '\$${state.productModel[index].price}',
                                    quantity: state.productModel[index].stock,
                                  ),
                                );
                              }
                              if (state is Empty) {
                                return Text(
                                  state.desc,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Gilroy',
                                  ),
                                );
                              }
                              return SizedBox.shrink();
                              // ListView(
                              //   shrinkWrap: true,
                              //   scrollDirection: Axis.horizontal,
                              //   children: const [
                              //     Exclusive(),
                              //     Exclusive(),
                              //     Exclusive(),
                              //   ],
                              // );
                            },
                            listener: (context, state) {
                              if (state is Failure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.grey.shade300,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            20.sp,
                                          ),
                                          topRight: Radius.circular(
                                            20.sp,
                                          )),
                                    ),
                                    content: Text(
                                      state.error,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          )),
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
                            // Exclusive(),
                            // Exclusive(),
                            // Exclusive(),
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
                          children: [
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
