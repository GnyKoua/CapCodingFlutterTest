import 'package:capcoding_test_technique_flutter_2024/routes/app_route_name.dart';
import 'package:capcoding_test_technique_flutter_2024/routes/app_route_routing.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/styles/app.theme.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CapCoding Test',
      theme: AppTheme.light,
      initialRoute: AppRouteName.contacts,
      onGenerateRoute: AppRouting.appRoutes,
    );
  }
}
