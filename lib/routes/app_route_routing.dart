import 'package:capcoding_test_technique_flutter_2024/features/contacts/views/detail_contact.screen.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/views/liste_contact.screen.dart';
import 'package:capcoding_test_technique_flutter_2024/routes/app_route_name.dart';
import 'package:flutter/material.dart';

abstract class AppRouting {
  static Route<dynamic> appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.contacts:
        return MaterialPageRoute(
          builder: (context) => const ListeContactScreen(),
        );
      case AppRouteName.detailcontact:
        return MaterialPageRoute(
          builder: (context) => const DetailContactScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ListeContactScreen(),
        );
    }
  }
}
