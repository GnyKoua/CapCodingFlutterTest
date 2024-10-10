import 'package:capcoding_test_technique_flutter_2024/utils/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinnerWidget extends StatelessWidget {
  const SpinnerWidget({
    super.key,
    this.size = 100,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        size: size,
        color: primaryConstratColor,
      ),
    );
  }
}
