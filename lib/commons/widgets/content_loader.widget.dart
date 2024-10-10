import 'package:capcoding_test_technique_flutter_2024/commons/enums/app_state_status.enum.dart';
import 'package:capcoding_test_technique_flutter_2024/commons/models/app_state.model.dart';
import 'package:capcoding_test_technique_flutter_2024/commons/widgets/spinner.widget.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/styles/colors.style.dart';
import 'package:flutter/material.dart';

class ContentLoaderWidget extends StatelessWidget {
  const ContentLoaderWidget({
    super.key,
    required this.state,
    required this.contentWidget,
  });

  final AppStateModel state;
  final Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case AppStateStatusEnum.LOADING:
        return const SpinnerWidget();
      case AppStateStatusEnum.ERROR:
        return Center(
          child: Text(
            state.message ?? "",
            style: const TextStyle(
              color: dangerColor,
            ),
          ),
        );
      default:
        return contentWidget;
    }
  }
}
