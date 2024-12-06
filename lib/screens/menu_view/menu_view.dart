import 'package:ecologital/common/assets.dart';
import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/screens/menu_view/enum/order_type_enum.dart';
import 'package:ecologital/screens/menu_view/menu_screen.dart';
import 'package:ecologital/screens/menu_view/menu_view_model.dart';
import 'package:ecologital/screens/menu_view/widget/food_card.dart';
import 'package:ecologital/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder: () => MenuViewModel(),
      onViewModelReady: (model) async {
        model.setBusy(true);
        await model.fetchCategories(index: model.tapIndex);
        await model.fetchItems();
        model.setBusy(false);
        Future.delayed(const Duration(seconds: 3), () async {
          await model.showBottomSheetMenu(context);
        });
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: color.primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                //fit: StackFit.passthrough,
                children: [
                  SizedBox(
                      height: 250,
                      width: screenWidth,
                      child: Image.asset(coverContainer, fit: BoxFit.fill)),
                  Positioned(
                    bottom: -30,
                    left: 80,
                    right: 80,
                    child: Container(
                      decoration: BoxDecoration(
                          color: color.primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () => commonProvider.onTabOrder(
                                  type: OrderTypeEnum.delivery),
                              child: Center(
                                  child: SizedBox(
                                height: 60,
                                width: 40,
                                child: Icon(
                                  Icons.delivery_dining,
                                  color: commonProvider.isDelivery
                                      ? color.baseColor
                                      : color.shadow,
                                ),
                              )),
                            ),
                          ),
                          Flexible(
                              child: GestureDetector(
                            onTap: () => commonProvider.onTabOrder(
                                type: OrderTypeEnum.pickup),
                            child: SizedBox(
                              height: 60,
                              width: 40,
                              child: Center(
                                child: Icon(
                                  Icons.shopping_bag_rounded,
                                  color: commonProvider.isPickup
                                      ? color.baseColor
                                      : color.shadow,
                                ),
                              ),
                            ),
                          )),
                          Flexible(
                              child: GestureDetector(
                            onTap: () => commonProvider.onTabOrder(
                                type: OrderTypeEnum.table),
                            child: Center(
                                child: SizedBox(
                              height: 60,
                              width: 40,
                              child: Icon(
                                Icons.table_bar_rounded,
                                color: commonProvider.isTable
                                    ? color.baseColor
                                    : color.shadow,
                              ),
                            )),
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              viewModel.isBusy
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.showBottomSheetMenu(context);
                                    },
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: color.darkGray),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text(commonProvider.isBreakfast
                                                ? "BreakFast Menu"
                                                : "Lunch Menu"),
                                            const Icon(
                                                Icons.keyboard_arrow_down),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.search)
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              _CategoryList(),
                              Container(child: _ItemList())
                            ],
                          ),
                        ),
                      ),
                    ),
              CommonButton(
                onPressed: () {},
                title: "Basket",
              ),
              const SizedBox(
                height: 10,
              ),
              CommonButton(
                isColor: false,
                onPressed: () {},
                title: "View Basket",
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CategoryList extends ViewModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel model) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = commonProvider.categoryList[index];
            return GestureDetector(
              onTap: () {
                model.onTapCategory(index: index, id: category.menuCategoryId);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: index == model.tapIndex
                          ? color.baseColor
                          : color.lightGray),
                  color: index == model.tapIndex
                      ? color.baseColor
                      : color.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        category.title.en,
                        style: TextStyle(
                          fontSize: texts.textSize16,
                          color: index == model.tapIndex
                              ? color.primaryColor
                              : color.textColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Visibility(
                        visible: index == model.tapIndex,
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: index == model.tapIndex
                              ? color.primaryColor
                              : color.textColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: commonProvider.categoryList.length),
    );
  }
}

class _ItemList extends ViewModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel model) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.itemList.length,
      itemBuilder: (context, index) {
        final item = model.itemList[index];
        return GestureDetector(
          onTap: () {
            //model.onItemTaped(id: item.menuItemId, context);
          },
          child: FoodCard(
            description: item.description.en,
            imageUrl: item.imageUrl,
            name: item.title.en,
            isPromotionAvailable: item.metaData.isDealProduct ?? false,
            onTab: () {
              model.onItemTaped(id: item.menuItemId, context);
            },
            price: commonProvider.isDelivery
                ? item.priceInfo.price.deliveryPrice
                : commonProvider.isPickup
                    ? item.priceInfo.price.pickupPrice
                    : item.priceInfo.price.tablePrice,
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 15,
      ),
    );
  }
}
