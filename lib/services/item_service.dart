import 'package:ecologital/model/data_model.dart';
import 'package:ecologital/model/item_model/item_model.dart';

class ItemService {
  static Future<List<ItemModel>> getItemList({required DataModel res}) async {
    try {
      if (res.status == true) {
        List<ItemModel> itemList = List<ItemModel>.from(res.result.items);
        return itemList;
      } else {
        throw Exception('Error fetching item data');
      }
    } catch (e) {
      throw Exception('Error fetching item data: $e');
    }
  }
}
