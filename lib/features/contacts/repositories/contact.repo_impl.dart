import 'package:capcoding_test_technique_flutter_2024/features/contacts/models/contact_list.model.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/repositories/contact.repo.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/api/api_client.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/api/api_urls.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/api/base_api_client.dart';

class ContactRepoImpl extends ContactRepo {
  final BaseApiClient _apiClient = ApiClient();

  @override
  Future<ContactListModel> loadContacts({
    required int size,
    required int page,
  }) async {
    try {
      final res = await _apiClient.apiGet(ApiUrls.listeContactsUrl(size, page));
      return ContactListModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
