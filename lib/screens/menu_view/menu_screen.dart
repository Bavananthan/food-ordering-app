import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/screens/menu_view/menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder: () => MenuViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: color.primaryColor,
          body: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Menu",
                          style: TextStyle(
                              fontSize: texts.textSize24,
                              fontWeight: texts.bold),
                        ),
                        GestureDetector(
                            onTap: () {
                              if (viewModel.tapMenuIndex != -1) {
                                Navigator.pop(context);
                              }
                            },
                            child: Icon(Icons.close))
                      ],
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, left: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: color.lightGray)),
                              child: ListTile(
                                onTap: () {
                                  viewModel.onTapMenu(
                                    context,
                                    index: index,
                                    value:
                                        commonProvider.menuList[index].title.en,
                                    id: commonProvider.menuList[index].menuId,
                                  );
                                },
                                trailing: CircleAvatar(
                                  backgroundColor:
                                      viewModel.tapMenuIndex == index
                                          ? color.baseColor
                                          : color.primaryColor,
                                  maxRadius: 15,
                                  child: CircleAvatar(
                                    maxRadius: 5,
                                    backgroundColor: color.primaryColor,
                                  ),
                                ),
                                title: Text(
                                    commonProvider.menuList[index].title.en),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: commonProvider.menuList.length),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MenuList {
  String id;
  String menuName;

  MenuList({required this.id, required this.menuName});
}
