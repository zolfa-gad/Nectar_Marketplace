
// urls


// Color greenColor = const Color(0xFF53B175);
// Color greenColor = const Color(0xFF3c823c);
// Color greenColor = const Color(0xFF408a13);
// color: const Color(0xFF53B175),
// color: const Color(0xFF55b175),
// color: Colors.tealAccent[400],
// color: Colors.greenAccent[400],
// Color(0xFF1FFF9F),
// Color(0xFF55c175),

// List list = [
//   ProductItem(
//     name: 'Organic Bananas',
//       image: 'assets/images/03.png',
//        quantity: '1Kg, Price',
//     price: 4.99,
//     // itemCount: 0,
//   ),
// ];
// List itemsList = [
//   ProductItem(
//     name: 'Organic Bananas',
//     image: 'assets/images/03.png',
//     type: 'Fresh Organic',
//     price: 4.99,
//     isFav: true,
//     isInCart: true,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Red Apple',
//     image: 'assets/images/Apples.png',
//     type: 'Fresh Organic',
//     price: 4.99,
//     isFav: true,
//     isInCart: true,
//     quantity: '1Kg, Price,',
//   ),
//   ProductItem(
//     name: 'Bell Pepper Red',
//     image: 'assets/images/Pepper.png',
//     type: 'Fresh Organic',
//     price: 4.99,
//     isFav: true,
//     isInCart: true,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Ginger',
//     image: 'assets/images/Ginger.png',
//     type: 'Fresh Organic',
//     price: 4.99,
//     // isInCart: true,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Beef Bone',
//     image: 'assets/images/Beef.png',
//     type: 'Meats',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Broiler Chicken',
//     image: 'assets/images/Chicken.png',
//     type: 'Meats',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Sprite Can',
//     image: 'assets/images/Sprite.png',
//     type: 'Beverages',
//     price: 4.99,
//     // isFav: true,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Diet Coke',
//     image: 'assets/images/Diet Coke.png',
//     type: 'Beverages',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Pepsi Can',
//     image: 'assets/images/Pepsi.png',
//     type: 'Beverages',
//     price: 4.99,
//     // isFav: true,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Coca Cola Can',
//     image: 'assets/images/Coca Cola.png',
//     type: 'Beverages',
//     price: 4.99,
//     // isInCart: true,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Apple & Grape Juice',
//     image: 'assets/images/Apple Grape Juice.png',
//     type: 'Beverages',
//     price: 4.99,
//     // isInCart: true,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Orange Juice',
//     image: 'assets/images/Orange Juice.png',
//     type: 'Beverages',
//     price: 4.99,
//     // isFav: true,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Fresh Fruits & Vegetable',
//     image: 'assets/images/Fresh Fruits_Vegetable.png',
//     type: 'Category',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Cooking Oil & Ghee',
//     image: 'assets/images/Cooking Oil_Ghee.png',
//     type: 'Category',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Meat & Fish',
//     image: 'assets/images/Meat_Fish.png',
//     type: 'Category',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Bakery & Snacks',
//     image: 'assets/images/Bakery_Snacks.png',
//     type: 'Category',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Dairy & Eggs',
//     image: 'assets/images/Dairy_Eggs.png',
//     type: 'Category',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
//   ProductItem(
//     name: 'Beverages',
//     image: 'assets/images/Beverages.png',
//     type: 'Category',
//     price: 4.99,
//     quantity: '1Kg, Price',
//   ),
// ];

// List categoriesList = [
//   CategoryModel(
//     name: 'Fresh Fruits & Vegetable',
//     image: 'assets/images/Fresh Fruits_Vegetable.png',
//   ),
//   CategoryModel(
//     name: 'Cooking Oil & Ghee',
//     image: 'assets/images/Cooking Oil_Ghee.png',
//   ),
//   CategoryModel(
//     name: 'Meat & Fish',
//     image: 'assets/images/Meat_Fish.png',
//   ),
//   CategoryModel(
//     name: 'Bakery & Snacks',
//     image: 'assets/images/Bakery_Snacks.png',
//   ),
//   CategoryModel(
//     name: 'Dairy & Eggs',
//     image: 'assets/images/Dairy_Eggs.png',
//   ),
//   CategoryModel(
//     name: 'Beverages',
//     image: 'assets/images/Beverages.png',
//   ),
// ];



// List favList = itemsList.map((e) {
//   // if (e.type != 'grocery') {
//   //   e.isFav = true;
//   //   return e;
//   // }
//   if (e.isFav == true) {
//     return e;
//   } else {
//     return;
//   }
// }).toList();

// List cartList = itemsList.map((e) {
//   // if (e.type != 'grocery') {
//   //   e.isInCart = true;
//   //   return e;
//   // }
//   if (e.isInCart == true) {
//     return e;
//   }else {
//     return;
//   }
// }).toList();

// List favList = [];

// returnFavList() {
//   for (var element in itemsList) {
//     if (element.isFav) {
//       favList.add(element);
//     }
//   }
// }

// List cartList = [];
// returnCartList() {
//   for (var element in itemsList) {
//     if (element.isInCart) {
//       cartList.add(element);
//     }
//   }
// }

// double totalPrice = 0.0;
// getAllPrice() {
//   totalPrice = 0.0;
//   for (var element in cartList) {
//     totalPrice += element.price;
//   }
// }
