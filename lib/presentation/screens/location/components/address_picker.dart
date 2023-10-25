import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/location_cubit.dart';
import '../cubit/location_state.dart';
import 'type_ahead_field.dart';

class AddressPicker extends StatelessWidget {
  const AddressPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Column(
          children: [
            // Country Picker
            SearchableField(
              title: 'Country',
              controller: LocationCubit.get(context).countryController,
              isEnabled: true,
              itemsList: LocationCubit.get(context).countryList,
              onTap: () {
                LocationCubit.get(context).getCountry();
              },
              onSuggestionSelected: (country) {
                //clear data
                // LocationCubit.get(context).clearAllData();
                LocationCubit.get(context).clearCityData();
                LocationCubit.get(context).clearRegionData();
                LocationCubit.get(context).setCurrentCountry(
                  country.toString(),
                );

                // if (state is LocationCountrySuccessState) {
                //   LocationCubit.get(context).getCity();
                // }
              },
            ),
            const SizedBox(height: 30),
            // City Picker

            SearchableField(
              title: 'City',
              controller: LocationCubit.get(context).cityController,
              isEnabled: LocationCubit.get(context).currentCountry != null
                  ? true
                  : false,
              itemsList: LocationCubit.get(context).cityList,
              onTap: () {
                LocationCubit.get(context).getCity();
              },
              onSuggestionSelected: (city) {
                LocationCubit.get(context).clearRegionData();
                LocationCubit.get(context).setCurrentCity(
                  city.toString(),
                );
                // if (state is LocationCitySuccessState) {
                //   LocationCubit.get(context).getRegion();
                // }
              },
            ),
            const SizedBox(height: 30),
            // Region Picker
            SearchableField(
              title: 'Region',
              controller: LocationCubit.get(context).regionController,
              isEnabled:
                  LocationCubit.get(context).currentCity != null ? true : false,
              itemsList: LocationCubit.get(context).regionList,
              onTap: () {
                LocationCubit.get(context).getRegion();
              },
              onSuggestionSelected: (region) {
                LocationCubit.get(context).setCurrentRegion(
                  region.toString(),
                );
              },
            ),
            // const SearchableField(),
            // const SearchableField(),
            // SearchDropDownButton(
            //   controller: LocationCubit.get(context).countryController,
            //   title: 'Country',
            //   itemsList: LocationCubit.get(context).countryList,
            //   // onSubmit: (model) {
            //   // if (LocationCubit.get(context).currentCountry == null) {
            //   // LocationCubit.get(context).setCurrentCountry(model);
            //   //   LocationCubit.get(context).getCity(model.item.id);
            //   // }
            //   // debugPrint('mncbzjxcnzdcn ');
            //   // LocationCubit.get(context).getCountry();
            //   // },
            // ),
            // SearchDropDownButton(
            //   controller: LocationCubit.get(context).cityController,
            //   title: 'City',
            //   itemsList: LocationCubit.get(context).cityList,
            //   // onSubmit: (model) {
            //   //   if (state is LocationCitySuccessState) {
            //   //     LocationCubit.get(context).getRegion(model.item.id);
            //   //   }
            //   // },
            // ),
            // SearchDropDownButton(
            //   controller: LocationCubit.get(context).regionController,
            //   title: 'Region',
            //   itemsList: LocationCubit.get(context).regionList,
            //   // onSubmit: () {},
            // ),
          ],
        );
      },
    );
    // MyDefaultAddressPicker(
    //   country: country, //country
    //   state: state, //zone
    //   city: city, //area
    //   textFieldInputBorder: const OutlineInputBorder(),
    // );
  }
}
