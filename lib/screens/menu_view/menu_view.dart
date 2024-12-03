import 'package:ecologital/common/assets.dart';
import 'package:ecologital/screens/menu_view/menu_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MenuViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: ListView(
            children: [
              Stack(
                children: [
                  Image.asset(coverContainer),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
