import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallet_app/widgets/Buttom_Navigation_bar.dart';
import 'package:wallet_app/Screens/peoples.dart';
import 'package:wallet_app/widgets/quicksend.dart';
import 'package:wallet_app/widgets/size_config.dart';
import 'Screens/Homescreen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('money');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return GetMaterialApp(
            theme: ThemeData(
                brightness: Brightness.dark, primarySwatch: Colors.green),
            debugShowCheckedModeBanner: false,
            home: BottomNavigation(),
          );
        });
      },
    );
  }
}
