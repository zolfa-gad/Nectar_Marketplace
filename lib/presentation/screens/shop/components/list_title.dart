import 'package:flutter/material.dart';

import '../../../../data/constants/colors.dart';
import '../../../../data/models/product_model.dart';
import '../../../components/text_button.dart';
import '../../../components/text_widget.dart';
import '../../see all/see_all_screen.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({
    Key? key,
    required this.title,
    required this.productsList,
  }) : super(key: key);

  final String title;
  final List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      // symmetric(
      //   horizontal: 10,
      //   vertical: 10,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultText(
            text: title,
            size: 24,
            weight: FontWeight.w600,
            color: Colors.black,
          ),
          productsList.isNotEmpty
              ? DefaultTextButton(
                  size: const Size(60, 30),
                  text: DefaultText(
                    text: 'See all',
                    size: 16,
                    weight: FontWeight.w600,
                    color: seeAllColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SeeAllScreen(
                            // id: categoryItem.id,
                            productsList: productsList,
                            title: title,
                          );
                        },
                      ),
                    );
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
