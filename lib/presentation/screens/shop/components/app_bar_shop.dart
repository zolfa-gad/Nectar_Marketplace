import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/constants/images.dart';
import '../../../../data/constants/titles.dart';
import 'address_text.dart';
import 'title_app_bar.dart';

class ShopAppBar extends StatelessWidget {
  const ShopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: appBarHeight * 2.3,
      collapsedHeight: appBarHeight + 5,
      // backgroundColor: Colors.transparent,
      // backgroundColor: Colors.black26,
      // elevation: 0,
      // floating: true,
      // snap: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        title: const ShopAppBarTitle(),
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              carrotLogoSvg,
              height: 30,
            ),
            const SizedBox(height: 12),
            const AddressText(),
            const SizedBox(height: appBarHeight + 15),
          ],
        ),
      ),
    );
  }
}
