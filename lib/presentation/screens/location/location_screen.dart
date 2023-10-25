// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/buttons.dart';
import '../../../data/constants/screens.dart';
import '../../components/colored_box.dart';
import '../../components/orange_button.dart';
import 'components/address_picker.dart';
import 'components/app_bar_location.dart';
import 'cubit/location_cubit.dart';
import 'cubit/location_state.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: BlocConsumer<LocationCubit, LocationState>(
        listener: (context, state) {
          if (state is LocationAddressSuccessState) {
            Navigator.pushReplacementNamed(context, homeScreen);
          }
        },
        builder: (context, state) {
          return Scaffold(
           
            body: SafeArea(
              child: DefaultColoredBox(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  shrinkWrap: true,
                  children: [
                    const LocationAppBar(),
                    const AddressPicker(),
                    DefaultOrangeButton(
                      text: submitButton,
                      isEnabled:
                          LocationCubit.get(context).currentRegion != null
                              ? true
                              : false,
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      onPressed: () {
                        if (LocationCubit.get(context).currentRegion != null) {
                          LocationCubit.get(context).setNewAddress(
                            LocationCubit.get(context).currentCity!.name,
                            LocationCubit.get(context).currentRegion!.name,
                            LocationCubit.get(context).currentCountry!.id,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

              // child: NestedScrollView(
              //   // floatHeaderSlivers: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   headerSliverBuilder: (context, _) {
              //     return [
              //       const LocationAppBar(),
              //     ];
              //   },

              //               ),