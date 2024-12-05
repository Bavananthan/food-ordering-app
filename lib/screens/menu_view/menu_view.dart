import 'package:ecologital/common/assets.dart';
import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/screens/menu_view/menu_screen.dart';
import 'package:ecologital/screens/menu_view/menu_view_model.dart';
import 'package:ecologital/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder: () => MenuViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: color.primaryColor,
          body: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                //fit: StackFit.passthrough,
                children: [
                  Image.asset(
                    coverContainer,
                    width: screenWidth,
                  ),
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
                            child: Center(
                              child: Image.asset(
                                delivery,
                                height: 60,
                                width: 40,
                              ),
                            ),
                          ),
                          Flexible(
                              child: Center(
                                  child: Image.asset(table,
                                      height: 60, width: 40))),
                          Flexible(
                              child: Center(
                                  child:
                                      Image.asset(take, height: 60, width: 40)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          useRootNavigator: true,
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          enableDrag: true,
                          context: context,
                          builder: (context) => MenuScreen(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(color: color.darkGray),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(viewModel.menuName),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.search)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _CategoryList(),
              CommonButton(
                onPressed: () {},
                title: "Basket",
              ),
              CommonButton(
                onPressed: () {},
                title: "View Basket",
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
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = commonProvider.categoryList[index];
              return GestureDetector(
                onTap: () {
                  model.onTapCategory(index: index);
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
                    padding: EdgeInsets.all(8.0),
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
                        SizedBox(
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
      ),
    );
  }
}
