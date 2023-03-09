import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/core/bindings/app_bindings.dart';
import 'package:test/core/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Teste Variação do Ativo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      getPages: AppRoutes.returnPages(),
      initialBinding: AppBindings(),
    );
  }
}
