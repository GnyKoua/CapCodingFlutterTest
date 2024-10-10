import 'package:capcoding_test_technique_flutter_2024/features/contacts/viewmodels/contact.viewmodel.dart';
import 'package:capcoding_test_technique_flutter_2024/main_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContactViewModel()),
      ],
      child: const MainApp(),
    ),
  );
}
