import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/icons.dart';
import '../../../../data/constants/prefs.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../../location/models/address_model.dart';
import '../models/category_model.dart';
import '../models/navigate_bar_model.dart';
import '../../account/e_account_screen.dart';
import '../../shop/a_shop_screen.dart';
import '../../cart/c_cart_screen.dart';
import '../../explore/b_explore_screen.dart';
import '../../favourite/d_favourite_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<CategoryDataModel> categoriesList = [];

  // List<BannerModel> bannersList = [];

  // List<ProductModel> productsList = [];

  // List<ProductModel> productsOfferList = [];

  // List<String> bannersImagesList = [];

  List<AddressDataModel> addressList = [];

  AddressDataModel homeAddress = AddressDataModel(
    id: 0,
    name: '',
    city: '',
    region: '',
    details: '',
    notes: '',
    latitude: 0,
    longitude: 0,
  );

  List<NavigateBarItem> navigateBarList = [
    NavigateBarItem(
      // icon: Icons.fastfood_outlined,
      svgIcon: shopSvgIcon,
      label: 'Shop',
      color: orangeColor, //grenColor
    ),
    NavigateBarItem(
      // icon: Icons.manage_search_outlined,
      svgIcon: exploreSvgIcon,

      label: 'Explore',
    ),
    NavigateBarItem(
      // icon: Icons.shopping_cart_outlined,
      svgIcon: cartSvgIcon,

      label: 'Cart',
    ),
    NavigateBarItem(
      // icon: Icons.favorite_border,
      svgIcon: favSvgIcon,

      label: 'Favourite',
    ),
    NavigateBarItem(
      // icon: Icons.person_outline,
      svgIcon: accountSvgIcon,

      label: 'Account',
    ),
  ];

  int screenIndex = 0;
  bool isInit = true;

  bool onSearchTap = false;
  bool isVisibleSearchTitle = false;

  int imageSliderIndex = 0;

  getCurrentScreen() {
    final screens = [
      const ShopScreen(),
      ExploreScreen(
        autofocus: onSearchTap,
        isVisibleTitle: isVisibleSearchTitle,
      ),
      const CartScreen(),
      const FavouriteScreen(),
      const AccountScreen(),
    ];
    return screens[screenIndex];
  }

  changeNavigateScreenIndex({required int indx, bool? onTap}) {
    screenIndex = indx;

    if (onTap == null || !onTap) {
      onSearchTap = false;
      isVisibleSearchTitle = false;
    } else {
      onSearchTap = true;
      isVisibleSearchTitle = true;
    }

    for (int i = 0; i < navigateBarList.length; i++) {
      if (i == indx) {
        navigateBarList[i].color = orangeColor;
      } else {
        navigateBarList[i].color = Colors.black;
      }
    }

    emit(NavigationScreenIndexState());
  }

  changeSliderImageIndex(int index, int length) {
    if (length < 6) {
      //5
      imageSliderIndex = index;
    } else {
      if (index == length - 1) {
        imageSliderIndex = 4;
      } else if (index < 4) {
        imageSliderIndex = index % 4;
      } else {
        imageSliderIndex = 3;
      }
    }

    emit(SliderChangeImageIndexState());
  }

  hideExploreAppBar(bool? onTap) {
    if (onTap == null || !onTap) {
      isVisibleSearchTitle = false;
    } else {
      isVisibleSearchTitle = true;
    }

    emit(HomeHideExploreBarState());
  }

  // getHomeImages() {
  //   productsList.clear();
  //   productsOfferList.clear();
  //   bannersList.clear();
  //   bannersImagesList.clear();
  //   emit(HomeFetchDataLoadingState());
  //   AppNetworkServices.getData(
  //     endPoint: homeEndPoint,
  //     token: AppLocalServices.getLocalData(tokenPrefs),
  //   ).then((value) {
  //     debugPrint('status: ${value['status'].toString()}');
  //     if (value['status']) {
  //       for (var element in value['data']['products']) {
  //         productsList.add(
  //           ProductModel.fromJson(element),
  //         );
  //         if (element['discount'] != 0) {
  //           productsOfferList.add(
  //             ProductModel.fromJson(element),
  //           );
  //         }
  //       }
  //       for (var element in value['data']['banners']) {
  //         bannersList.add(
  //           BannerModel.fromJson(element),
  //         );
  //       }
  //       for (var element in bannersList) {
  //         bannersImagesList.add(element.image);
  //       }
  //     }
  //     emit(HomeFetchDataSuccessState());
  //   }).catchError(
  //     (error) {
  //       debugPrint('Error: ${error.toString()}');
  //       emit(HomeFetchDataErrorState());
  //     },
  //   );
  // }

  // refreshData() {
  //   for (var element in productsList) {
  //     if (element.inCart) {
  //       element.inCart = !element.inCart;
  //       debugPrint('ele: ${element.inCart}');
  //     }
  //   }
  //   emit(HomeDataRefreshState());
  // }

  getCategories() {
    emit(HomeCategoriesLoadingState());

    AppNetworkServices.getData(
      endPoint: categoriesEndPoint,
    ).then((value) {
      if (value['status']) {
        for (var element in value['data']['data']) {
          categoriesList.add(CategoryDataModel.fromJson(element));
        }
      }
      emit(HomeCategoriesSuccessState());
    }).catchError(
      (error) {
        debugPrint('Error: ${error.toString()}');
        emit(HomeCategoriesErrorState());
      },
    );
  }

  getAddress() {
    emit(HomeAddressLoadingState());
    AppNetworkServices.getData(
      endPoint: addressEndPoint,
      token: AppLocalServices.getLocalData(tokenPrefs),
    ).then((value) {
      if (value['status']) {
        for (var element in value['data']['data']) {
          addressList.add(AddressDataModel.fromJson(element));
        }

        // var temp = addressList.firstWhere(
        //   (element) {
        //     element.name.toLowerCase() == 'home';
        //     return '${element.city}, ${element.region}';
        //   },
        // );

        homeAddress = addressList.firstWhere(
          (element) => element.name.toLowerCase() == 'home',
        );
        // homeAddress = '${temp.city}, ${temp.region}';
        // addressList = value['data']['data'];

        debugPrint('Address: $addressList');

        // if (addressList.isEmpty) {
        //   addressModel = null;
        //   AppLocalServices.deleteLocalData(addressPrefs);
        //   debugPrint('statement: Address null');
        // } else {
        //   addressModel = AddressDataModel.fromJson(
        //     // one element
        //     addressList[0],
        //   );
        //   AppLocalServices.saveLocalData(
        //     addressPrefs,
        //     '${addressList[0]['city']}, ${addressList[0]['region']}',
        //   );
        // }

      }
      emit(HomeAddressSuccessState());
    }).catchError(
      (error) {
        debugPrint('Error: ${error.toString()}');
        emit(HomeAddressErrorState());
      },
    );
  }

  fetchAllData() {
    getCategories();

    // getHomeImages();

    getAddress();
  }
}
