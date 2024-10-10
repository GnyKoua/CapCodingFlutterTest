import 'dart:developer';

import 'package:capcoding_test_technique_flutter_2024/commons/models/app_state.model.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/models/contact.model.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/models/contact_list.model.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/repositories/contact.repo.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/repositories/contact.repo_impl.dart';
import 'package:flutter/material.dart';

class ContactViewModel with ChangeNotifier {
  final ContactRepo _repo = ContactRepoImpl();
  final int _size = 50;

  InfoModel? _activeInfo;
  ContactModel? _selectedContact;
  AppStateModel<List<ContactModel>> _contacts = AppStateModel.loading();

  ContactViewModel() {
    fetchContacts();
  }

  AppStateModel<List<ContactModel>> get contacts => _contacts;
  set contacts(AppStateModel<List<ContactModel>> data) {
    _contacts = data;
    notifyListeners();
  }

  ContactModel? get selectedContact => _selectedContact;
  set selectedContact(ContactModel? item) {
    _selectedContact = item;
    notifyListeners();
  }

  Future<void> fetchContacts() async {
    _repo
        .loadContacts(
      size: _size,
      page: _activeInfo?.page ?? 0,
    )
        .then((value) {
      _activeInfo = value.info;

      List<ContactModel> datas = _contacts.data ?? [];
      datas.addAll(value.results ?? []);
      contacts = AppStateModel.completed(datas);

      notifyListeners();
    }).onError((error, stackTrace) {
      log(error.toString(), error: error, name: "ERROR");
      contacts = AppStateModel.error(error?.toString());
    });
  }
}
