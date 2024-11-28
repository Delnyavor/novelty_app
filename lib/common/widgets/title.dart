import 'package:flutter/material.dart';
import 'package:novelty_app/common/theming/constants.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold, fontFamily: ramillasFontFamily),
    );
  }
}
