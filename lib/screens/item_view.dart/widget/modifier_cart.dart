import 'package:ecologital/provider/locator.dart';
import 'package:flutter/material.dart';

class ModifierCart extends StatelessWidget {
  final String modifierName;
  const ModifierCart({
    super.key,
    required this.modifierName,
  });

  @override
  Widget build(BuildContext context) {
    bool tab = true;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              tab = !tab;
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    modifierName,
                    style: TextStyle(fontWeight: texts.bold, fontSize: 14),
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
          ),
          Visibility(
            visible: tab,
            child: Container(
              decoration: BoxDecoration(
                  color: color.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "beef",
                              style: TextStyle(
                                  fontWeight: texts.medium, fontSize: 14),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                    //  onTap: () => model.decrease(),
                                    child: Center(
                                        child: Icon(
                                  Icons.remove,
                                  size: 15,
                                ))),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(child: Text("01")),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                    //    onTap: () => model.increase(),
                                    child: Center(
                                        child: Icon(
                                  Icons.add,
                                  size: 15,
                                ))),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
