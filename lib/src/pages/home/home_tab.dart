// ignore_for_file: must_be_immutable

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/config/app_data.dart' as app_data;
import 'package:food_app_getx/src/pages/auth/components/item_tile.dart';
import '../auth/components/categories_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  String selectedCategory = 'Fruits';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Appbar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 25,
            ),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: CustomColor.customSwatchColor,
                  fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: CustomColor.customContrasColor,
                  fontWeight: FontWeight.bold
                )
              ),
            ]
          )
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: badges.Badge(
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                    Icons.shopping_cart,
                    color: CustomColor.customSwatchColor,
                  )
              ),
            ),
          )
        ],

      ),

      body: Column(
        children: [
          //Search
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                hintText: 'Searching...',
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColor.customContrasColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  )
                )
              ),
            ),
          ),

          //Categories
          Container(
            padding: const EdgeInsets.only(left: 25),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoriesTile(
                    onPressed: () {
                      setState(() {
                        selectedCategory = app_data.categories[index];
                      });
                    },
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == selectedCategory,
                  );
                }, 
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: app_data.categories.length,
              ),
            ),
          ),

          //Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9/11.5,
              ),
              itemCount: app_data.items.length, 
              itemBuilder: (_, index) {
                return ItemTile(
                  item: app_data.items[index],
                );
              }
            ),
          )
        ],
      ),
    );
  }
}