part of 'shop_bloc.dart';

@immutable
sealed class ShopState {}

final class ShopInitial extends ShopState {}

final class Success extends ShopState {
  final List<ProductModel> productModel;

  Success({required this.productModel});
}

final class Failure extends ShopState {
  final String error;

  Failure(
    this.error,
  );
}

final class Empty extends ShopState {
  final String desc;

  Empty(this.desc);
}

final class Loading extends ShopState {}
