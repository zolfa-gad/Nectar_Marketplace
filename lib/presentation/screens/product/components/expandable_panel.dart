// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/label_model.dart';
import '../../../components/text_widget.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';
import 'panel_title.dart';

class ExpandablePanel extends StatelessWidget {
  // final String headerValue;
  // final String expandedValue;
  // double transformAngle = 0;
  // final Function() onExpansionChanged;
  // final double transformAngle;

  final LabelModel panel;
  final Widget? trailing;
  bool isExpand = false;

  ExpandablePanel({
    Key? key,
    required this.panel,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return ExpansionTile(
          iconColor: Colors.black,
          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 0,
          ),
          onExpansionChanged: (isExpanded) {
            isExpand = isExpanded;
          },
          trailing: Transform.rotate(
            angle: ProductCubit.get(context).panelArrowTransform(
              isExpand,
            ),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: Colors.black,
            ),
          ),
          title: PanelItemTitle(label: panel.primaryLabel),
          children: [
            DefaultText(
              padding: const EdgeInsets.only(left: 15),
              text: panel.secondaryLabel,
              color: Colors.grey[800]!,
              size: 13,
              weight: FontWeight.w500,
              maxLines: 100,
              align: TextAlign.left,
            ),
          ],
        );
      },
    );
  }
}
          // panel.panelName == bloc.productPanel.panelName
          //     ? Transform.rotate(
          //         angle: panel.panelTransformAngle,
          //         child: const Icon(
          //           Icons.arrow_forward_ios_rounded,
          //           size: 20,
          //           color: Colors.black,
          //         ),
          //       )
          //     : SizedBox(
          //         width: 60,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Container(
          //               padding: const EdgeInsets.all(3),
          //               decoration: BoxDecoration(
          //                 color: Colors.black12,
          //                 borderRadius: BorderRadius.circular(5),
          //               ),
          //               child: CustomText(
          //                 text: bloc.nutritionQuantity,
          //                 size: 10,
          //                 weight: FontWeight.w600,
          //                 color: Colors.black45,
          //               ),
          //             ),
          //             Transform.rotate(
          //               angle: panel.panelTransformAngle,
          //               child: const Icon(
          //                 Icons.arrow_forward_ios_rounded,
          //                 size: 20,
          //                 color: Colors.black,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),

          

/*
SingleChildScrollView(
          child: ExpansionPanelList(
            
            elevation: 0,
            expandedHeaderPadding: const EdgeInsets.all(0),

            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                bloc.isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: true,

                // backgroundColor: Colors.green[100],
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    isThreeLine: false,
                    trailing: IconBtn(
                      icon: Icons.arrow_forward_ios_rounded,
                      onPressed: () {},
                    ),
                    title: CustomText(
                      text: headerValue,
                      color: Colors.black,
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                  );
                },
                body: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 22),
                  onTap: () {},
                  
                  title: CustomText(
                    text: expandedValue,
                    color: Colors.grey[600]!,
                    size: 13,
                    weight: FontWeight.w500,
                  ),
                ),
              
                isExpanded: bloc.isExpanded,
              )
            ],
            // children: _data.map<ExpansionPanel>((Item item) {
            //   return ;
            // }).toList(),
          ),
        );
      */
