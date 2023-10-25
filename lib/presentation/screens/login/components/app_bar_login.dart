import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/constants/buttons.dart';
import '../../../../data/constants/images.dart';
import '../../../../data/constants/titles.dart';
import '../../../../data/models/label_model.dart';
import '../../../components/screen_label.dart';

class LogInAppBar extends StatelessWidget {
  const LogInAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appBarHeight * 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: appBarHeight * 3,
            child: SvgPicture.asset(
              carrotLogoSvg,
              height: 50,
            ),
          ),
          ScreenLabel(
            padding: const EdgeInsets.only(bottom: 10),
            textAlign: TextAlign.left,
            label: LabelModel(
              primaryLabel: logInButton,
              secondaryLabel: 'Enter your emails and password',
            ),
          ),
          // Divider(
          //   color: Colors.grey[300],
          //   height: 2,
          //   thickness: 2.5,
          // ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:nectar_groceriet/data/models/label_model.dart';

// import '../../../../data/constants/buttons.dart';
// import '../../../../data/constants/images.dart';
// import '../../../../data/constants/other_consts.dart';
// import '../../../components/screen_label.dart';

// class LogInAppBar extends StatelessWidget {
//   const LogInAppBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // double currentWidth = MediaQuery.of(context).size.width;
//     double currentHeight = MediaQuery.of(context).size.height;

//     return SliverAppBar(
//       floating: true,
//       // pinned: true,
//       // snap: true,
//       // elevation: 1,
//       collapsedHeight: currentHeight / 2.5,
//       expandedHeight: currentHeight / 2.5,
//       backgroundColor: Colors.transparent,
//       flexibleSpace: FlexibleSpaceBar(
//         centerTitle: true,
//         expandedTitleScale: 1,
//         collapseMode: CollapseMode.none,
//         titlePadding: const EdgeInsets.symmetric(
//           horizontal: 25,
//           vertical: 10,
//         ),
//         title: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Transform.translate(
//               offset: Offset(0, -currentHeight / 5.5),
//               child: SvgPicture.asset(
//                 carrotLogoSvg,
//                 height: 50,
//               ), //45
//             ),
//             ScreenLabel(
//               textAlign: TextAlign.left,
//               label: LabelModel(
//                 primaryLabel: logInButton,
//                 secondaryLabel: 'Enter your emails and password',
//               ),
//             ),
//           ],
//         ),
//         // background: Image.asset(
//         //   blurBackground,
//         //   fit: BoxFit.cover,
//         // ),
//       ),
//     );
//   }
// }

// title: logInLabel['title'],
// subTitle: logInLabel['subTitle'],
// title: 'Loging',
// text: 'Enter your emails and password',
// title: type == 'in' ? 'Loging' : 'Sign Up',
// text: type == 'in'
//     ? 'Enter your emails and password'
//     : 'Enter your credentials to continue',
