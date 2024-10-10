import 'package:capcoding_test_technique_flutter_2024/gen/assets.gen.dart';
import 'package:capcoding_test_technique_flutter_2024/utils/styles/colors.style.dart';
import 'package:flutter/material.dart';

class DetailContactInfoItemWidget extends StatelessWidget {
  const DetailContactInfoItemWidget({
    super.key,
    required this.label,
    required this.value,
    this.iconSize = 25,
    this.iconData,
    this.iconSvg,
  }) : assert(iconData != null || iconSvg != null);

  final String label;
  final String value;
  final double iconSize;
  final IconData? iconData;
  final SvgGenImage? iconSvg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: iconData != null
                ? Icon(
                    iconData,
                    size: iconSize,
                    color: iconBlueColor,
                  )
                : iconSvg?.svg(
                    color: iconBlueColor,
                    height: iconSize,
                    width: iconSize,
                  ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
