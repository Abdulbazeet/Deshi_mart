import 'package:deshi_mart/common/widgets/custom_button.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  checkout() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(
                20.sp,
              ),
              child: Column(children: [Row(
                children: [
                  Text('Checkout'),
                ],
              )],),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontFamily: 'Gilroy'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey.shade300,
            height: 14.sp,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(
                20.sp,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset('assets/images/banana.png'),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Organic Banana',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            15.sp,
                                          ),
                                        ),
                                        side: const BorderSide(
                                          color: Colors.grey,
                                          width: .5,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove,
                                      color: Global_Variables.main_color,
                                      size: 20.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.sp,
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.sp,
                                  ),
                                  IconButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            15.sp,
                                          ),
                                        ),
                                        side: BorderSide(
                                          color: Colors.grey,
                                          width: .5,
                                        ),
                                      ),
                                    ),
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
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //subtitle: Row(),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey.shade300,
                ),
                itemCount: 5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
            ),
            child: CustomButton(
              text: 'Go to Checkout',
              onPressed: checkout,
              color: Global_Variables.main_color,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
        ],
      ),
    );
  }
}
