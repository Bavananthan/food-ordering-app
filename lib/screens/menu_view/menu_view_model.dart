import 'package:stacked/stacked.dart';

class MenuViewModel extends BaseViewModel {
  bool _isTap = false;
  bool get isTap => _isTap;

//after tap a menu
  String _menuName = "Select ";
  String get menuName => _menuName;
  set setMenuName(value) {
    _menuName = value;
    notifyListeners();
  }

//tap index for category
  int _tapIndex = -1;
  int get tapIndex => _tapIndex;
  set setIndex(value) => _tapIndex = value;

  void onTapCategory({required int index}) {
    if (index == _tapIndex) {
      _tapIndex = -1;
    } else {
      setIndex = index;
    }

    notifyListeners();
  }

  int _tapMenuIndex = 0;
  int get tapMenuIndex => _tapMenuIndex;
  set setMenuIndex(value) => _tapMenuIndex = value;

  void onTapMenu({required int index, required String value}) {
    if (index != _tapMenuIndex) {
      _tapMenuIndex = index;
      setMenuName = value;
    }

    notifyListeners();
  }

  //we have to create list oflist catacory items
  //[[],[],[]] all menu

  //getCategory wise all menu list
  getFullMenuList() {
    // List menuCategory = commonProvider.menuList.map((e) {
    // commonProvider.itemList.where((element) => element.categoryIDs,)
    //   return
    // });
  }
}
