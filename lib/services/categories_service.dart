import 'package:ecologital/model/categories_model.dart';
import 'package:ecologital/model/data_model.dart';

class CategoriesService {
  static Future<List<CategoriesModel>> getCategoryList(
      {required DataModel response}) async {
    try {
      if (response.status == true) {
        List<CategoriesModel> categoryList =
            List<CategoriesModel>.from(response.result.categories);
        return categoryList;
      } else {
        throw Exception('Error fetching categories data');
      }
    } catch (e) {
      throw Exception('Error fetching categories data: $e');
    }
  }
}
