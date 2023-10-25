import 'package:flutter/material.dart';

import '../../../../data/constants/images.dart';
import '../cubit/account_cubit.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AccountCubit.get(context).loginModel == null
        ? const CircularProgressIndicator()
        : CircleAvatar(
            radius: 35,
            backgroundImage: imageReturn(context),
          );
  }
}

ImageProvider imageReturn(context) {
  if (AccountCubit.get(context).loginModel!.userData!.image.contains(
        'valux',
      )) {
    return  const AssetImage(profileImage);
  } else {
    return NetworkImage(
      AccountCubit.get(context).loginModel!.userData!.image,
    );
  }
}
