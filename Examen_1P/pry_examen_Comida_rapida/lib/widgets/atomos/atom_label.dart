import 'package:flutter/material.dart';

class AtomLabel extends StatelessWidget {
  final String text;
  final bool isTitle;

  const AtomLabel({required this.text, this.isTitle = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: isTitle 
        ? theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.primary)
        : theme.textTheme.bodyMedium,
    );
  }
}
