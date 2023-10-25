import 'package:flutter/material.dart';

import '../../../../data/constants/images.dart';
import '../../../../data/constants/titles.dart';
import '../../../../data/models/label_model.dart';
import '../../../components/screen_label.dart';

class LocationAppBar extends StatelessWidget {
  const LocationAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appBarHeight * 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: appBarHeight * 3,
            child: Image.asset(
              locationImage,
            ),
          ),
          ScreenLabel(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            textAlign: TextAlign.center,
            labelAlign: CrossAxisAlignment.center,
            label: LabelModel(
              primaryLabel: 'Select Your Location',
              secondaryLabel:
                  'Swithch on your location to stay in tune with what\'s happening in your area',
            ),
          ),
        ],
      ),
    );

    // return SliverAppBar(
    //   floating: true,
    //   // pinned: true,
    //   // snap: true,
    //   elevation: 1,
    //   collapsedHeight: currentHeight / 2,
    //   expandedHeight: currentHeight / 2,
    //   backgroundColor: Colors.white,
    //   flexibleSpace: FlexibleSpaceBar(
    //     centerTitle: true,
    //     expandedTitleScale: 1,
    //     collapseMode: CollapseMode.none,
    //     titlePadding: const EdgeInsets.symmetric(
    //       horizontal: 25,
    //       vertical: 10,
    //     ),
    //     title: Stack(
    //       alignment: Alignment.bottomCenter,
    //       children: [
    //         Transform.translate(
    //           offset: Offset(0, -currentHeight / 6),
    //           child: Image.asset(
    //             locationImage,
    //             // fit: BoxFit.scaleDown,
    //             height: 150,
    //           ),
    //           // const CarrotLogoImage(
    //           //   height: 45,
    //           // ),
    //         ),
    //         ScreenLabel(
    //           textAlign: TextAlign.center,
    //           labelAlign: CrossAxisAlignment.center,
    //           label: LabelModel(
    //             primaryLabel: 'Select Your Location',
    //             secondaryLabel:
    //                 'Swithch on your location to stay in tune with what\'s happening in your area',
    //           ),
    //         ),
    //       ],
    //     ),
    //     background: Image.asset(
    //       blurBackground,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );
  }
}

// title: logInLabel['title'],
// subTitle: logInLabel['subTitle'],
// title: 'Loging',
// text: 'Enter your emails and password',
// title: type == 'in' ? 'Loging' : 'Sign Up',
// text: type == 'in'
//     ? 'Enter your emails and password'
//     : 'Enter your credentials to continue',
