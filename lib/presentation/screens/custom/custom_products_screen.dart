import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../../components/app_bar_default.dart';
import '../../components/icon_button.dart';
import 'components/products_list_custom.dart';
import 'cubit/custom_products_cubit.dart';
import 'cubit/custom_products_state.dart';

class CustomProductsScreen extends StatelessWidget {
  const CustomProductsScreen({
    Key? key,
    required this.title,
    required this.id,
    // required this.productsList,
  }) : super(key: key);

  final String title;
  final int id;
  // final List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomProductsCubit()..getProductsCategory(id),
      child: BlocBuilder<CustomProductsCubit, CustomProductsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size(
                double.infinity,
                appBarHeight,
              ),
              child: SafeArea(
                child: DefaultAppBar(
                  titleText: title,
                  leadingIcon: DefaultIconButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                // child: CustomProductsAppBar(title: title),
              ),
            ),
            body: Center(
              child: state is CustomProductsLoadingState
                  ? const CircularProgressIndicator()
                  : const CustomProductsList(),
            ),
          );
        },
      ),
    );
  }
}
