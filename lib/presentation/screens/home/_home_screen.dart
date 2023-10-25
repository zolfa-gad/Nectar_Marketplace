// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../account/cubit/account_cubit.dart';
import '../explore/cubit/explore_cubit.dart';
import '../shop/cubit/shop_cubit.dart';
import 'components/bottom_navigation_bar.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..fetchAllData(),
        ),
        // BlocProvider(
        //   create: (context) => ShopCubit()..getHomeData(),
        // ),
        BlocProvider(
          create: (context) => AccountCubit()..getProfilData(),
        ),
        BlocProvider(
          create: (context) => ExploreCubit(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeInitialState) {
            HomeCubit.get(context).changeNavigateScreenIndex(indx: 0);
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const BottomNavigateBar(),
            body: Center(
              // child: screens[HomeCubit.get(context).screenIndex],
              child: HomeCubit.get(context).getCurrentScreen(),
            ),
          );
        },
      ),
    );
  }
}
