import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/screens/item_view.dart/item_view_model.dart';
import 'package:ecologital/screens/item_view.dart/widget/modifier_cart.dart';
import 'package:ecologital/widgets/common_button.dart';
import 'package:ecologital/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class ItemView extends StatelessWidget {
  final String id;
  const ItemView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder<ItemViewModel>.reactive(
      viewModelBuilder: () => ItemViewModel(),
      onViewModelReady: (model) async {
        await model.fetchItemGetByID(id: id);
        model.increase();
      },
      builder: (context, model, child) {
        int price = commonProvider.isDelivery
            ? model.item.priceInfo.price.deliveryPrice
            : commonProvider.isPickup
                ? model.item.priceInfo.price.pickupPrice
                : model.item.priceInfo.price.tablePrice;
        return model.isBusy
            ? const Expanded(child: Center(child: CircularProgressIndicator()))
            : Container(
                color: color.primaryColor,
                height: MediaQuery.of(context).copyWith().size.height * 0.95,
                width: MediaQuery.of(context).copyWith().size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15.0, left: 15, top: 15),
                          child: Icon(
                            Icons.close,
                            size: 25,
                            color: color.shadow,
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15.0,
                            left: 15,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: screenWidth,
                                  child: commonNetworkImageProvider(
                                      imageUrl: model.item.imageUrl,
                                      width: screenWidth,
                                      hight: 200),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        model.item.title.en,
                                        style: TextStyle(
                                            fontSize: texts.textSize16,
                                            fontWeight: texts.bold),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "\$ ${price}",
                                        style: TextStyle(
                                            fontSize: texts.textSize16,
                                            fontWeight: texts.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: Icon(
                                      size: 20,
                                      Icons.location_on_outlined,
                                      color: color.baseColor,
                                    )),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          size: 20,
                                          Icons.star,
                                          color: color.baseColor,
                                        ),
                                        Text(
                                          "${model.item.aggregatedProductRating}",
                                          style: TextStyle(
                                              fontSize: texts.textSize14,
                                              fontWeight: texts.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  model.item.description.en,
                                  style: TextStyle(
                                      fontSize: texts.textSize12,
                                      fontWeight: texts.light),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(),
                                _ModifierGroup(),
                                Divider(
                                  height: 5,
                                  color: color.darkGray,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Add Comments (Optional)",
                                  style: TextStyle(
                                      fontSize: texts.textSize12,
                                      fontWeight: texts.light),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const TextField(
                                  maxLines: 5,
                                  //   expands: true,

                                  keyboardType: TextInputType.multiline,
                                  textAlignVertical: TextAlignVertical(y: -1),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: 'Write here',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: color.darkGray,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 48,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () => model.decrease(),
                                          child: Center(
                                              child: Icon(
                                            Icons.remove,
                                            color: color.baseColor,
                                          ))),
                                      Center(child: Text("${model.count}")),
                                      GestureDetector(
                                          onTap: () => model.increase(),
                                          child: Center(
                                              child: Icon(Icons.add,
                                                  color: color.baseColor))),
                                    ],
                                  ),
                                )),
                          )),
                          Flexible(
                            child: CommonButton(
                              title: "Add Cart  \$ ${model.totalPrice}",
                              onPressed: () {
                                model.addCartList(context);
                              },
                              radius: 10,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}

class _ModifierGroup extends ViewModelWidget<ItemViewModel> {
  const _ModifierGroup({super.key});

  @override
  Widget build(BuildContext context, ItemViewModel model) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final modifier = model.modifierGroups[index];
          return ModifierCart(modifierName: modifier.title.en);
        },
        separatorBuilder: (context, index) => Divider(
              height: 4,
            ),
        itemCount: model.modifierGroups.length);
  }
}
