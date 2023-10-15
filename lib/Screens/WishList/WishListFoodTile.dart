// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foodish/Screens/Home/HomeDataModel/DataModel.dart';
import 'package:foodish/Screens/WishList/bloc/wishlist_bloc.dart';

class WishListFoodTile extends StatelessWidget {
  final ProductModel productModel;
  final WishlistBloc wishlistBloc;
  const WishListFoodTile(
      {super.key, required this.productModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(productModel.imageURL))),
        ),
        Text(
          productModel.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ ${productModel.price}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      wishlistBloc.add(RemoveItem(deleteItem: productModel));
                    },
                    icon: const Icon(Icons.favorite)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined))
              ],
            )
          ],
        )
      ]),
    );
  }
}