// ignore_for_file: must_be_immutable

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:food_app_getx/src/config/custom_colors.dart';
import 'package:food_app_getx/src/config/app_data.dart' as app_data;
import 'package:food_app_getx/src/pages/home/view/components/item_tile.dart';
import 'package:food_app_getx/src/pages/common_widget/custom_shimmer.dart';
import 'package:food_app_getx/src/pages/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'components/categories_tile.dart';
import '../../common_widget/app_name_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppNameWidget(),
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
                  child: AddToCartIcon(
                    key: globalKeyCartItems,
                    icon: Icon(
                      Icons.shopping_cart,
                      color: CustomColor.customSwatchColor,
                    ),
                  )),
            ),
          )
        ],
      ),

      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCartAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            //Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        ))),
              ),
            ),

            //Categories
            GetBuilder<HomeController>(builder: (controller) {
              return Container(
              padding: const EdgeInsets.only(left: 25),
              child: SizedBox(
                height: 40,
                child: !controller.isCategoryLoading ? ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoriesTile(
                      onPressed: () {
                        controller.selectedCategory(controller.allCategories[index]);
                      },
                      category: controller.allCategories[index].title,
                      isSelected:
                          controller.allCategories[index] == controller.currentCategory,
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(width: 10),
                  itemCount: controller.allCategories.length,
                ) : ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10, (index) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 12),
                    child: CustomShimmer(
                      height: 20, 
                      width: 80,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
                ),
              ),
            );
            }),

            //Grid
            GetBuilder<HomeController>(builder: (controller) {
              return Expanded(
              child: !controller.isProductLoading
                  ? GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 9 / 11.5,
                      ),
                      itemCount: controller.allProducts.length,
                      itemBuilder: (_, index) {

                        if(((index + 1) == controller.allProducts.length) && !controller.isLastPage) {
                          controller.loadMoreProducts();
                        }

                        return ItemTile(
                          cartAnimationMethod: itemSelectedCartAnimation,
                          item: controller.allProducts[index],
                        );
                      })
                  : GridView.count(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                      children: List.generate(10, (index) => CustomShimmer(
                        height: double.infinity, 
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(20),
                        )
                      ),
                    ),
            );
            })
          ],
        ),
      ),
    );
  }
}
