import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/explore/widets/product_category.dart';
import 'package:deshi_mart/presentation/explore/widets/products.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

enum ExplorePage {
  mainCategory,
  productSearch,
}

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final categoryImages = Global_Variables.categoryProduct;
  ExplorePage _explorePage = ExplorePage.mainCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _explorePage == ExplorePage.mainCategory
          ? AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Find Products',
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  //       color: Colors.green,
                ),
              ),
              centerTitle: true,
            )
          : null,
      body: _explorePage == ExplorePage.mainCategory
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
                vertical: 20.sp,
              ).copyWith(bottom: 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.sp,
                    ).copyWith(left: 0),
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
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 22.sp,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _explorePage = ExplorePage.productSearch;
                              });
                            },
                            child: const Text(
                              'Search store',
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Expanded(
                      child: GridView.builder(
                    itemCount: categoryImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.sp,
                      mainAxisSpacing: 20.sp,
                    ),
                    //  padding: EdgeInsets.all(10.sp),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.push('/product_screen',
                              extra: categoryImages[index]['name']);
                        },
                        child: ProductCategory(
                          category: categoryImages[index]['name']!,
                          image: categoryImages[index]['image']!,
                        ),
                      );
                    },
                  ))
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.sp,
                vertical: 20.sp,
              ).copyWith(bottom: 0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.sp,
                          ).copyWith(left: 0),
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
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 22.sp,
                                ),
                              ),
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
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/filter.png',
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Expanded(
                      child: GridView.builder(
                    //  shrinkWrap: true,
                    itemCount: categoryImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.sp,
                      mainAxisSpacing: 20.sp,
                      childAspectRatio: .78,
                    ),
                    //  padding: EdgeInsets.all(10.sp),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          // onTap: () {
                          //   setState(() {
                          //     _explorePage = ExplorePage.productSearch;
                          //   });
                          // },
                          child: const Product());
                    },
                  ))
                ],
              ),
            ),
    );
  }
}
