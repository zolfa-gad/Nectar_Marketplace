import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/cubit/product_cubit.dart';
import '../cubit/carts_cubit.dart';
import '../cubit/carts_state.dart';
import '../models/carts_model.dart';
import 'image_cart_item.dart';
import 'item_counter_product.dart';
import 'name_cart_item.dart';
import 'price_cart_item.dart';
import 'remove_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartsModel cartItem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CartItemImage(
                      product: cartItem.product,
                    ),
                  ),
                  // Spacer(),
                  const SizedBox(
                    width: 7,
                  ),
                  SizedBox(
                    width: 270,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CartItemName(product: cartItem.product),
                            RemoveCartItemButton(product: cartItem.product)
                          ],
                        ),
                        Row(
                          children: [
                            CartItemQuantity(cartItem: cartItem),
                            const Spacer(),
                            CartItemPrice(
                              price: cartItem.product.price,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

          // Container(
          //   color: Colors.amber[100],
          //   width: double.infinity,
          //   height: 200,
          //   child: Row(
          //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Image.asset('assets/images/Sprite.png', height: 50),
          //       Column(
          //         children: [
          //           Container(
          //             color: Colors.red[100],
          //             constraints: BoxConstraints(maxWidth: double.infinity),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               mainAxisSize: MainAxisSize.max,
          //               children: [
          //                 Container(
          //                   color: Colors.blue[100],
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       CustomText(
          //                         text: bloc.productName,
          //                         color: Colors.black,
          //                         size: 24,
          //                         weight: FontWeight.bold,
          //                       ),
          //                       CustomText(
          //                         text: bloc.productQuantity,
          //                         color: Colors.black54,
          //                         size: 16,
          //                         weight: FontWeight.w600,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 IconBtn(
          //                   icon: Icons.close,
          //                   color: Colors.black54,
          //                   onPressed: () {},
          //                 ),
          //               ],
          //             ),
          //           )
          //         ],
          //       )

          //       // SizedBox(
          //       //   width: double.infinity,
          //       //   child: Column(
          //       //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       //     mainAxisSize: MainAxisSize.max,
          //       //     children: [
          //       //       Row(
          //       //         mainAxisAlignment: MainAxisAlignment.end,
          //       //         children: [
          //       //           Container(
          //       //             color: Colors.red,
          //       //             width: 300,
          //       //             child: Expanded(
          //       //               child: ListTile(
          //       //                 title: CustomText(
          //       //                   text: bloc.productName,
          //       //                   color: Colors.black,
          //       //                   size: 24,
          //       //                   weight: FontWeight.bold,
          //       //                 ),
          //       //                 subtitle: CustomText(
          //       //                   text: bloc.productQuantity,
          //       //                   color: Colors.black54,
          //       //                   size: 16,
          //       //                   weight: FontWeight.w600,
          //       //                 ),
          //       //               ),
          //       //             ),
          //       //           ),
          //       //           IconBtn(
          //       //             icon: Icons.close,
          //       //             color: Colors.black54,
          //       //             onPressed: () {},
          //       //           ),
          //       //         ],
          //       //       ),
          //       //       // buttons and quantity
          //       //       // Padding(
          //       //       //   padding: const EdgeInsets.symmetric(
          //       //       //     horizontal: 25,
          //       //       //     vertical: 20,
          //       //       //   ),
          //       //       //   child: Row(
          //       //       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       //       //     children: [
          //       //       //       Row(
          //       //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       //       //         crossAxisAlignment: CrossAxisAlignment.center,
          //       //       //         children: [
          //       //       //           IconBtn(
          //       //       //             icon: Icons.remove,
          //       //       //             size: 30,
          //       //       //             color: bloc.productCount == 1
          //       //       //                 ? Colors.black26
          //       //       //                 : bloc.greenColor,
          //       //       //             onPressed: bloc.productCount != 1
          //       //       //                 ? () {
          //       //       //                     bloc.productDecrease();
          //       //       //                   }
          //       //       //                 : null,
          //       //       //           ),
          //       //       //           Container(
          //       //       //             width: 45,
          //       //       //             height: 45,
          //       //       //             alignment: Alignment.center,
          //       //       //             margin: const EdgeInsets.symmetric(horizontal: 5),
          //       //       //             decoration: BoxDecoration(
          //       //       //               border: Border.all(
          //       //       //                 color: Colors.black26,
          //       //       //               ),
          //       //       //               borderRadius: BorderRadius.circular(17),
          //       //       //             ),
          //       //       //             child: CustomText(
          //       //       //               text: bloc.productCount.toString(),
          //       //       //               size: 18,
          //       //       //               weight: FontWeight.w600,
          //       //       //               color: Colors.black,
          //       //       //             ),
          //       //       //           ),
          //       //       //           IconBtn(
          //       //       //             icon: Icons.add,
          //       //       //             size: 30,
          //       //       //             color: bloc.greenColor,
          //       //       //             onPressed: () {
          //       //       //               bloc.productIncrease();
          //       //       //             },
          //       //       //           ),
          //       //       //         ],
          //       //       //       ),
          //       //       //       CustomText(
          //       //       //         text: '\$${bloc.productPrice}',
          //       //       //         size: 24,
          //       //       //         weight: FontWeight.bold,
          //       //       //         color: Colors.black,
          //       //       //       )
          //       //       //     ],
          //       //       //   ),
          //       //       // ),
          //       //     ],
          //       //   ),
          //       // )
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
