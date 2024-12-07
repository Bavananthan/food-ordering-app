import 'package:ecologital/model/data_model.dart';
import 'package:ecologital/model/modifierGroups/modifier_groups_model.dart';

class ModifierService {
  static Future<List<ModifierGroupsModel>> getModifierList(
      {required DataModel res}) async {
    try {
      if (res.status == true) {
        List<ModifierGroupsModel> modifierList =
            List<ModifierGroupsModel>.from(res.result.modifierGroups);
        return modifierList;
      } else {
        throw Exception('Error fetching modifier data');
      }
    } catch (e) {
      throw Exception('Error fetching modifier data: $e');
    }
  }
}
