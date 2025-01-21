import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String id;

  final String name;
  final String price;
  final String description;
  final String category;
  final String brand;
  final String adminId;
  final int stock;
  final int salesCount;
  final double discountedPrice;
  final Discount discount;
  final List<String> image;

  ProductModel(
      {required this.id,
      required this.discountedPrice,
      required this.name,
      required this.price,
      required this.description,
      required this.category,
      required this.brand,
      required this.adminId,
      required this.stock,
      required this.salesCount,
      required this.discount,
      required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'category': category,
      'brand': brand,
      'adminId': adminId,
      'stock': stock,
      'salesCount': salesCount,
      'discount': discount.toMap(),
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    double originalPrice = double.parse(map['price']);
    int discountPercentage = map['discount']['percentage'] ?? 0;
    double discounted = ((100 - discountPercentage) / 100) * originalPrice;
    return ProductModel(
      discountedPrice: discounted,
      id: map['_id'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      brand: map['brand'] as String,
      adminId: map['adminId'] as String,
      stock: map['stock'] as int,
      salesCount: map['salesCount'] as int,
      discount: Discount.fromMap(map['discount'] as Map<String, dynamic>),
      image: List<String>.from(
        (map['image'] as List<dynamic>).map((item) => item as String),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Discount {
  final int percentage;
  final DateTime? startDate;
  final DateTime? endDate;
  Discount({
    required this.percentage,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'percentage': percentage,
      'startDate': startDate!.toIso8601String(),
      'endDate': endDate!.toIso8601String(),
    };
  }

  factory Discount.fromMap(Map<String, dynamic> map) {
    return Discount(
      percentage: map['percentage'] as int,
      // startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
      // endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate'] as int),
      startDate:
          map['startDate'] != null ? DateTime.parse(map['startDate']) : null,
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Discount.fromJson(String source) =>
      Discount.fromMap(json.decode(source) as Map<String, dynamic>);
}
