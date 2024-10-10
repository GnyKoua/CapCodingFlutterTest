import 'package:capcoding_test_technique_flutter_2024/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class ActionDetailsContactWidget extends StatelessWidget {
  const ActionDetailsContactWidget({
    super.key,
    required this.svgSrc,
    required this.label,
    required this.color,
  });

  final SvgGenImage svgSrc;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(35),
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: color),
            ),
            child: svgSrc.svg(
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
