import 'package:capcoding_test_technique_flutter_2024/features/contacts/models/contact_list.model.dart';

abstract class ContactRepo {
  Future<ContactListModel> loadContacts({
    required int size,
    required int page,
  });
}
