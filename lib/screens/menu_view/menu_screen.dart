import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/screens/menu_view/menu_view_model.dart';
import 'package:ecologital/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close))
                      ],
                    ),
                  ),
                  Divider(),
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: color.lightGray)),
                          child: ListTile(
                            onTap: () {
                              viewModel.onTapMenu();
                            },
                            trailing: CircleAvatar(
                              backgroundColor: commonProvider.isLunch
                                  ? color.baseColor
                                  : color.primaryColor,
                              maxRadius: 15,
                              child: CircleAvatar(
                                maxRadius: 5,
                                backgroundColor: color.primaryColor,
                              ),
                            ),
                            title: Text("Lunch · 10am - 5pm"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: color.lightGray)),
                          child: ListTile(
                            onTap: () {
                              viewModel.onTapMenu();
                            },
                            trailing: CircleAvatar(
                              backgroundColor: commonProvider.isBreakfast
                                  ? color.baseColor
                                  : color.primaryColor,
                              maxRadius: 15,
                              child: CircleAvatar(
                                maxRadius: 5,
                                backgroundColor: color.primaryColor,
                              ),
                            ),
                            title: Text("Breakfast · 5pm - 11pm "),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CommonButton(
                        isColor: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: "Done",
                      ),
                    ],
                  ))
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
