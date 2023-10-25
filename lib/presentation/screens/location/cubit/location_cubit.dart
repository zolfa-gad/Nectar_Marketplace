import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../data/constants/end_points.dart';
import '../../../../data/constants/prefs.dart';
import '../models/address_model.dart';
import '../../../../data/services/local_sevices.dart';
import '../../../../data/services/network_sevices.dart';
import '../models/city_model.dart';
import '../models/country_model.dart';
import '../models/region_model.dart';
import 'location_state.dart';
import 'dart:async';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitialState());

  static LocationCubit get(context) => BlocProvider.of(context);

  AddressDataModel? addressModel;
  // = AddressDataModel(
  //   id: 0,
  //   name: '',
  //   city: '',
  //   region: '',
  //   details: '',
  //   notes: '',
  //   latitude: 0,
  //   longitude: 0,
  // );

  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();

  List<CountryModel> countryList = [];
  List<CityModel> cityList = [];
  List<RegionModel> regionList = [];
  List allPlaces = [];
  CountryModel? currentCountry;
  CityModel? currentCity;
  RegionModel? currentRegion;

  // late String currentCountry;

  Future getCountry() async {
    emit(LocationCountryLoadingState());
    clearAllData();
    var jsonString = await rootBundle
        .loadString(
      'assets/json/country.json',
    )
        .catchError(
      (error) {
        debugPrint('Error: $error');
        emit(LocationCountryErrorState());
      },
    );

    List<dynamic> body = json.decode(jsonString);

    countryList = body
        .map(
          (dynamic item) => CountryModel.fromJson(item),
        )
        .toList();
    debugPrint('statement: Success');
    // countryController.addListener(() {
    //   if (countryController.text.isNotEmpty) {
    //     for (var element in countryList) {
    //       if (element.name == countryController.text) {
    //         currentCountry = element;
    //         break;
    //       }
    //     }
    //     // emit(LocationSetNewCountryState());
    //   }
    // });
    emit(LocationCountrySuccessState());

    // debugPrint(countryList.toString());
    // _countrySubList = _countryList;
  }

  Future getCity() async {
    emit(LocationCityLoadingState());

    // clearCityData();
    // clearRegionData();
    cityList.clear();
    regionList.clear();

    List<CityModel> subCityList = [];
    var jsonString = await rootBundle
        .loadString(
      'assets/json/city.json',
    )
        .catchError((error) {
      debugPrint('Error: $error');
      emit(LocationCityErrorState());
    });
    List<dynamic> body = json.decode(jsonString);

    subCityList = body
        .map(
          (dynamic item) => CityModel.fromJson(item),
        )
        .toList();
    for (var element in subCityList) {
      if (element.countryID == currentCountry!.id) {
        cityList.add(element);
        debugPrint('ELE: $element');
      }
    }
    emit(LocationCitySuccessState());

    // _stateSubList = _stateList;
  }

  Future getRegion() async {
    emit(LocationRegionLoadingState());
    clearRegionData();
    List<RegionModel> subRegionList = [];
    var jsonString = await rootBundle.loadString(
        // 'packages/country_state_city_pro/assets/city.json',
        'assets/json/region.json').catchError(
      (error) {
        debugPrint('Error: $error');
        emit(LocationRegionErrorState());
      },
    );
    List<dynamic> body = json.decode(jsonString);

    subRegionList = body
        .map(
          (dynamic item) => RegionModel.fromJson(item),
        )
        .toList();
    for (var element in subRegionList) {
      if (element.cityID == currentCity!.id) {
        regionList.add(element);
        debugPrint('hsh: $element');
      }
      emit(LocationRegionSuccessState());

      // _citySubList = _cityList;
    }
  }

  setCurrentCountry(String country) {
    countryController.text = country;
    for (var element in countryList) {
      if (element.name == country) {
        currentCountry = element;
        break;
      }
    }
    emit(LocationSetNewCountryState());
    getCity();
  }

  setCurrentCity(String city) {
    cityController.text = city;
    for (var element in cityList) {
      if (element.name == city) {
        currentCity = element;
        break;
      }
    }
    emit(LocationSetNewCityState());
    getRegion();
  }

  setCurrentRegion(String region) {
    regionController.text = region;
    for (var element in regionList) {
      if (element.name == region) {
        currentRegion = element;
        break;
      }
    }
    emit(LocationSetNewRegionState());
  }

  clearCountryData() {
    // countryList.clear();
    currentCountry = null;
    countryController.clear();
    emit(LocationClearAllDataState());
  }

  clearCityData() {
    // cityList.clear();
    debugPrint('statement: Clear City Data');
    currentCity = null;
    cityController.clear();
    emit(LocationClearAllDataState());
  }

  clearRegionData() {
    // regionList.clear();
    debugPrint('statement: Clear Region Data');

    currentRegion = null;
    regionController.clear();
    emit(LocationClearAllDataState());
  }

  clearAllData() {
    clearCountryData();
    clearCityData();
    clearRegionData();
    emit(LocationClearAllDataState());
  }

  setNewAddress(String city, String region, String id) {
    emit(LocationAddressLoadingState());
    debugPrint('Get New Address');
    debugPrint('City: $city');
    debugPrint('Region $region');

    AppNetworkServices.postData(
      data: {
        "name": "Home",
        "city": city,
        "region": region,
        "details": id,
        "notes": "_",
        "latitude": 0.1,
        "longitude": 0.1,
      },
      endPoint: addressEndPoint,
      token: AppLocalServices.getLocalData(tokenPrefs),
    ).then((value) {
      debugPrint('Status: ${value['status']}');
      debugPrint('Add: $value');

      if (value['status']) {
        debugPrint('Addrss: ${value['data']}');

        addressModel = AddressDataModel.fromJson(
          value['data'],
        );
        AppLocalServices.saveLocalData(
          addressPrefs,
          '$city, $region',
        );
      }
      emit(LocationAddressSuccessState());
      return value;
    }).catchError(
      (error) {
        debugPrint('Error: ${error.toString()}');
        emit(LocationAddressErrorState());
      },
    );
  }
}
