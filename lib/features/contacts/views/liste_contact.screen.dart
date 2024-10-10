import 'package:capcoding_test_technique_flutter_2024/commons/enums/app_state_status.enum.dart';
import 'package:capcoding_test_technique_flutter_2024/commons/models/app_state.model.dart';
import 'package:capcoding_test_technique_flutter_2024/commons/widgets/content_loader.widget.dart';
import 'package:capcoding_test_technique_flutter_2024/commons/widgets/spinner.widget.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/viewmodels/contact.viewmodel.dart';
import 'package:capcoding_test_technique_flutter_2024/features/contacts/widgets/contact_item.widget.dart';
import 'package:capcoding_test_technique_flutter_2024/routes/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListeContactScreen extends StatefulWidget {
  const ListeContactScreen({super.key});

  @override
  State<ListeContactScreen> createState() => _ListeContactScreenState();
}

class _ListeContactScreenState extends State<ListeContactScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactViewModel>(builder: (_, value, __) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Liste des contacts(${(value.contacts.data ?? []).length})",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ContentLoaderWidget(
                state: value.contacts,
                contentWidget: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      ...(value.contacts.data ?? [])
                          .map(
                            (element) => ContactItemWidget(
                              item: element,
                              onClick: () {
                                context
                                    .read<ContactViewModel>()
                                    .selectedContact = element;
                                Navigator.of(context)
                                    .pushNamed(AppRouteName.detailcontact);
                              },
                            ),
                          )
                          .toList(),
                      Visibility(
                        visible: value.contacts.status ==
                            AppStateStatusEnum.LOADMORE,
                        child: const SpinnerWidget(size: 50),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  void _scrollControllerListener() {
    final viewModel = context.read<ContactViewModel>();

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      viewModel.fetchContacts();
    } else if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.95) {
      viewModel.contacts = AppStateModel.loadmore(viewModel.contacts.data);
    }
  }
}
