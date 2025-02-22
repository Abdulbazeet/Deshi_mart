// ignore_for_file: constant_identifier_names, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String uri = "https://deshi-mart.vercel.app";

class Global_Variables {
  static const main_color = Color(0xfff53B175);
  static String setPrice(String number) {
    double fr = double.parse(number);
    // Format number with commas
    String formattedNumber = NumberFormat("#,##0.00").format(fr);
    return (formattedNumber);
  }

  // static const primary_color = Color(0xFFF53B175);
  static final List<Map<String, String>> categoryProduct = [
    {
      'name': "Fresh Fruits & Vegetables",
      "image": "assets/images/vegetable.png"
    },
    {
      'name': "Cooking Oils",
      "image": "assets/images/Cooking_oil.png",
    },
    {
      'name': "Meat & Fish",
      "image": "assets/images/meat_fish.png",
    },
    {
      'name': "Bakery & Pastries",
      "image": "assets/images/bakery.png",
    },
    {
      'name': "Diary & Eggs",
      "image": "assets/images/diaries.png",
    },
    {
      'name': "Beverages",
      "image": "assets/images/beverages.png",
    },
    {
      'name': "Frozen foods",
      "image": "assets/images/froze.png",
    },
    {
      'name': "Spices & Seasoning",
      "image": "assets/images/spices.png",
    },
    {
      'name': "Personal Care",
      "image": "assets/images/personal.png",
    },
    {
      'name': "Household Supplies",
      "image": "assets/images/household.png",
    },
  ];
}
