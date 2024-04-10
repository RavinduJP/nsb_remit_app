import 'package:flutter/material.dart';

enum ContentAlignment {
  start,
  center,
  end;

  MainAxisAlignment get mainAxisAlignment {
    switch (this) {
      case ContentAlignment.start:
        return MainAxisAlignment.start;

      case ContentAlignment.center:
        return MainAxisAlignment.center;

      case ContentAlignment.end:
        return MainAxisAlignment.end;
    }
  }
}

class RowAlignmentWidget extends StatelessWidget {
  const RowAlignmentWidget(
      {super.key,
      this.alignment = ContentAlignment.center,
      required this.child});

  final ContentAlignment alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment.mainAxisAlignment,
      children: [child],
    );
  }
}

class ColumnAlignmentWidget extends StatelessWidget {
  const ColumnAlignmentWidget(
      {super.key,
      this.alignment = ContentAlignment.center,
      required this.child});

  final ContentAlignment alignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: alignment.mainAxisAlignment,
      children: [child],
    );
  }
}
