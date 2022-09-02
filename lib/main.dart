import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/merchant_controller.dart';
import 'package:food_delivery/screens/home/main_page.dart';
import 'package:get/get.dart';
import 'helper/ dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<MercahntController>().getMerchantList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      // home: const HomeScreen(),
    );
  }
}
