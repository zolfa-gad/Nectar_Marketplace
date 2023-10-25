import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../../../data/models/product_model.dart';
import '../../components/app_bar_default.dart';
import '../../components/icon_button.dart';
import 'components/products_list_see_all.dart';
import 'cubit/see_all_cubit.dart';
import 'cubit/see_all_state.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({
    Key? key,
    required this.title,
    // required this.id,
    required this.productsList,
  }) : super(key: key);

  final String title;
  // final int id;
  final List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeeAllCubit()..getProductsCategory(title),
      child: BlocBuilder<SeeAllCubit, SeeAllState>(
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
              ),
            ),
            body: Center(
              child: state is SeeAllProductsLoadingState
                  ? const CircularProgressIndicator()
                  : SeeAllProductsList(productsList: productsList),
            ),
          );
        },
      ),
    );
  }
}
