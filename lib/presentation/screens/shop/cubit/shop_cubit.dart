import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../models/banner_model.dart';
import 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  // List<CategoryDataModel> categoriesList = [];

  List<BannerModel> bannersList = [];

  List<ProductModel> productsList = [];

  List<ProductModel> productsOfferList = [];

  List<String> bannersImagesList = [];

  // int imageBannerIndex = 0;

  // changeBannerImageIndex(int index, int length) {
  //   if (length < 6) {
  //     //5
  //     imageBannerIndex = index;
  //   } else {
  //     if (index == length - 1) {
  //       imageBannerIndex = 4;
  //     } else if (index < 4) {
  //       imageBannerIndex = index % 4;
  //     } else {
  //       imageBannerIndex = 3;
  //     }
  //   }

  //   emit(ShopChangeBannerImageIndexState());
  // }

  // getCategories() {
  //   emit(ShopCategoriesLoadingState());
  //   AppNetworkServices.getData(
  //     endPoint: categoriesEndPoint,
  //   ).then((value) {
  //     // Map<String, dynamic> result = value.data;
  //     // debugPrint('Value: ${value.toString()}');
  //     if (value['status']) {
  //       // debugPrint('Data: ${value['data']['data'].toString()}');
  //       for (var element in value['data']['data']) {
  //         categoriesList.add(CategoryDataModel.fromJson(element));
  //       }
  //     }
  //     // debugPrint('Categories: $categoriesList');
  //     // loginModel = LogInModel.fromJson(value);
  //     emit(ShopCategoriesSuccesState());
  //   }).catchError(
  //     (error) {
  //       debugPrint('Error: ${error.toString()}');
  //       emit(ShopCategoriesErrorState());
  //     },
  //   );
  // }

  // getBanners() {
  //   emit(ShopBannersLoadingState());
  //   AppNetworkServices.getData(
  //     endPoint: bannersEndPoint,
  //   ).then((value) {
  //     if (value['status']) {
  //       for (var element in value['data']) {
  //         bannersList.add(BannerModel.fromJson(element));
  //         // debugPrint(element.toString());
  //         // bannersList.add(BannerModel(id: 0, image: bannerImage));
  //       }
  //     }
  //     emit(ShopBannersSuccesState());
  //   }).catchError(
  //     (error) {
  //       debugPrint('Error: ${error.toString()}');
  //       emit(ShopBannersErrorState());
  //     },
  //   );
  // }

  getHomeData() {
    emit(ShopHomeDataLoadingState());
    AppNetworkServices.getData(
      endPoint: homeEndPoint,
      token: AppLocalServices.getLocalData(tokenPrefs),
    ).then((value) {
      debugPrint('status: ${value['status'].toString()}');
      if (value['status']) {
        for (var element in value['data']['products']) {
          productsList.add(
            ProductModel.fromJson(element),
          );
          if (element['discount'] != 0) {
            productsOfferList.add(
              ProductModel.fromJson(element),
            );
          }
        }
        for (var element in value['data']['banners']) {
          bannersList.add(
            BannerModel.fromJson(element),
          );
        }
        for (var element in bannersList) {
          bannersImagesList.add(element.image);
        }
      }
      emit(ShopHomeDataSuccessState());
    }).catchError(
      (error) {
        debugPrint('Error: ${error.toString()}');
        emit(ShopHomeDataErrorState());
      },
    );
  }

  getAllData() {
    // emit(ShopLoadingState());

    // getAddress();
    // emit(ShopLoadingState());

    // getBanners();
    // emit(ShopLoadingState());

    // getCategories();
    // emit(ShopLoadingState());

    // getHomeImages();
  }
}
