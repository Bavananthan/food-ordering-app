import 'package:ecologital/common/app_colors.dart';
import 'package:ecologital/common/app_texts.dart';
import 'package:ecologital/provider/common_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance; //get instance

//set global object
final commonProvider = locator<CommonProvider>();
final color = locator<AppColors>();
final texts = locator<AppTexts>();

//
void setup() {
  locator.registerLazySingleton<CommonProvider>(() => CommonProvider());
  locator.registerLazySingleton<AppColors>(() => AppColors());
  locator.registerLazySingleton<AppTexts>(() => AppTexts());
}
