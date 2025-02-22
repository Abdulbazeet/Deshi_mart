import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deshi_mart/constants/global_variables.dart';
import 'package:deshi_mart/constants/shared.dart';
import 'package:deshi_mart/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitial()) {
    on<ShowExclusiveOffer>(_showExclusiveOffer);
    // on<ShowBestSelling>(_showBestSelling);
    // on<ShowAdvert>(_showAdvert);
  }

  Future<void> _showExclusiveOffer(
      ShowExclusiveOffer event, Emitter<ShopState> emit) async {
    final connectionResult = await Connectivity().checkConnectivity();
    if (connectionResult == ConnectivityResult.none) {
      emit(
        Failure('No internet connection detected'),
      );
    }
    emit(Loading());
    try {
      String token = await Shared.getToken();
      http.Response res = await http.get(
        Uri.parse('$uri/get_best_selling'),
        headers: <String, String>{
          'Content-Type': "application/json",
          "authToken": token
        },
      );

      switch (res.statusCode) {
        case 200:
          // print(jsonDecode(res.body));
          List<ProductModel> products = [];

          if (jsonDecode(res.body) == []) {
            emit(
              Empty(
                "No available product for exclusive offer",
              ),
            );
            return;
          }

          List<dynamic> product = jsonDecode(res.body);

          List<Map<String, dynamic>> decodedProduct =
              product.cast<Map<String, dynamic>>();
          for (int i = 0; i < decodedProduct.length; i++) {
            if (decodedProduct[i]['discount']['percentage'] > 0) {
              //   print(decodedProduct[i]);
              Map<String, dynamic> currentProduct = decodedProduct[i];

              DateTime? endDate =
                  DateTime.parse(decodedProduct[i]['discount']['endDate']);
              DateTime now = DateTime.now();
              //  print(now);
              if ((endDate.isAfter(now))) {
                products.add(
                  ProductModel.fromMap(currentProduct),
                );
              }
            }
          }
          if (products.isNotEmpty) {
            emit(
              Success(productModel: products),
            );
          } else {
            emit(
              Empty(
                'No available product for exclusive offer',
              ),
            );
          }

        case 500:
          emit(
            Failure(
              jsonDecode(res.body)['error'],
            ),
          );
          break;
        default:
      }
    } catch (e) {
      emit(Failure(e.toString()));
      print(e);
    }
  }

  Future<void> _showBestSelling(
      ShowBestSelling event, Emitter<ShopState> emit) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(Failure('No internet connection detected'));
    }
  }

  // Future<void> _showAdvert(ShowAdvert event, Emitter<ShopState> emit) async {}
}
