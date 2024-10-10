import 'package:capcoding_test_technique_flutter_2024/features/contacts/models/contact.model.dart';

class ContactListModel {
  List<ContactModel>? results;
  InfoModel? info;

  ContactListModel({this.results, this.info});

  ContactListModel.fromJson(Map<String, dynamic> json) {
    results = <ContactModel>[];
    json['results'].forEach((v) {
      results?.add(ContactModel.fromJson(v));
    });
    info = json['info'] != null ? InfoModel?.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results?.map((v) => v.toJson()).toList();
    data['info'] = info?.toJson();
    return data;
  }
}

class InfoModel {
  String? seed;
  int? results;
  int? page;
  String? version;

  InfoModel({this.seed, this.results, this.page, this.version});

  InfoModel.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    results = json['results'];
    page = json['page'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seed'] = seed;
    data['results'] = results;
    data['page'] = page;
    data['version'] = version;
    return data;
  }
}
