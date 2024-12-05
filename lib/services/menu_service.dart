import 'package:ecologital/model/data_model.dart';
import 'package:ecologital/model/menu_model.dart';

class MenuService {
  static Future<List<MenuModel>> getMenuList({required DataModel res}) async {
    try {
      if (res.status == true) {
        List<MenuModel> menuList = List<MenuModel>.from(res.result.menu);
        return menuList;
      } else {
        throw Exception('Error fetching menu data');
      }
    } catch (e) {
      throw Exception('Error fetching menu data: $e');
    }
  }
}
