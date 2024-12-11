import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/explore/widets/product_category.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}


class _ExploreState extends State<Explore> {
  final categoryImages = Global_Variables.categoryProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Find Products',
          style: TextStyle(
            fontFamily: 'Gilroy',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
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
            SizedBox(
              height: 20.sp,
            ),
            Expanded(
                child: GridView.builder(
              itemCount: categoryImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              //  padding: EdgeInsets.all(10.sp),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ProductCategory(
                    category: categoryImages[index]['name']!,
                    image: categoryImages[index]['image']!,
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
