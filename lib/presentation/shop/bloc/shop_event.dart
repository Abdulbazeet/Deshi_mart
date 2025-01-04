part of 'shop_bloc.dart';

@immutable
sealed class ShopEvent {}

final class ShowExclusiveOffer extends ShopEvent {}

final class ShowBestSelling extends ShopEvent {}

final class ShowAdvert extends ShopEvent {}
