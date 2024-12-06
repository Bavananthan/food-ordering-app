import 'package:ecologital/provider/common_provider.dart';
import 'package:ecologital/provider/locator.dart';
import 'package:ecologital/screens/menu_view/menu_view.dart';
import 'package:ecologital/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  //fetch json data
  await readDataJson();

  runApp(ChangeNotifierProvider(
    create: (context) => CommonProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Food Order App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Urbanist',
          colorScheme: ColorScheme.fromSeed(seedColor: color.baseColor),
          useMaterial3: true,
        ),
        home: const MenuView(),
      ),
    );
  }
}
