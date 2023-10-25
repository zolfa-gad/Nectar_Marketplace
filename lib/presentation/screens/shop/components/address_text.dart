import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/text_widget.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/cubit/home_state.dart';

class AddressText extends StatelessWidget {
  const AddressText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.grey[700]!,
            ),
            // SvgPicture.asset(locationSvgIcon),
            const SizedBox(width: 3),
            DefaultText(
              // text: AppLocalServices.getLocalData(addressPrefs) ?? '',
              // text: HomeCubit.get(context).addressList != null
              //     ? '${HomeCubit.get(context).addressList.firstWhere(
              //           (element) => element.name.toLowerCase() == 'home',
              //         ).city}, ${HomeCubit.get(context).addressList.firstWhere(
              //           (element) => element.name.toLowerCase() == 'home',
              //         ).region}'
              //     : '',
              text:HomeCubit.get(context).homeAddress==null ?'':
                  '${HomeCubit.get(context).homeAddress.city}, ${HomeCubit.get(context).homeAddress.region}',

              size: 18,
              weight: FontWeight.w600,
              color: Colors.grey[700]!,
              fontFamily: null,
            )
          ],
        );
      },
    );
  }
}
