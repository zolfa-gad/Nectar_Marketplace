import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/titles.dart';
import '../../../data/models/label_model.dart';
import '../../../data/models/product_model.dart';
import '../home/cubit/home_cubit.dart';
import 'components/app_bar_product.dart';
import 'components/button_add_cart.dart';
import 'components/expandable_panel.dart';
import 'components/favourite_button.dart';
import 'components/image_product_item.dart';
import 'components/item_counter_product.dart';
import 'components/name_product_item.dart';
import 'components/panel_title.dart';
import 'components/price_product_item.dart';
import 'components/review_buttons.dart';
import 'cubit/product_cubit.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final ProductModel productItem;
  final String productDetail = 'Product Detail';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            appBarHeight - 20,
          ),
          child: ProductAppBar(
            productImages: productItem.productImages,
            // imageProduct: productItem.image,
            // cntxt: context,
            // onPressed: () {
            //   showDialog(
            //     context: context,
            //     builder: (context) {
            //       return ProductItemImagesList(
            //         productImages: productItem.productImages,
            //       );

            //     },
            //   );
            // },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: appBarHeight),
              ProductItemImagesList(
                productImages: productItem.productImages,
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                trailing: FavouriteButton(product: productItem),
                title: ProductItemName(name: productItem.name),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductItemCount(product: productItem),
                    ProductItemPrice(price: productItem.price),
                  ],
                ),
              ),
              ExpandablePanel(
                panel: LabelModel(
                  primaryLabel: productDetail,
                  secondaryLabel: productItem.description,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                title: const PanelItemTitle(label: 'Review'),
                trailing: ReviewButtons(
                  product: productItem,
                ),
              ),
              AddToBasketButton(prdouct: productItem),
            ],
          ),
        ),
      ),
    );
  }
}
