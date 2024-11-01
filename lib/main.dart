import 'package:flutter/material.dart';
import 'package:phong_vu/presentation/detail_product_screen.dart';
import 'package:phong_vu/service_locator.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await initialDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
   return const MaterialApp(
      home:  DetailProductScreen(),

    );
  }
}
