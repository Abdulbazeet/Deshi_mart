import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/presentation/explore/widets/products.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatefulWidget {
  final String category;
  const ProductScreen({
    super.key,
    required this.category,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          widget.category,
          style: const TextStyle(
            fontFamily: 'Gilroy',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/filter.png',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.sp,
            crossAxisSpacing: 20.sp,
            childAspectRatio: .78,
          ),
          itemCount: Global_Variables.categoryProduct.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  context.push('/product_details');
                },
                child: Product());
          },
        ),
      ),
    );
  }
}
