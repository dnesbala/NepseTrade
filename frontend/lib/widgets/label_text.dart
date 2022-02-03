import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;
  final String value;
  final Color textColor;

  const LabelText(
      {Key? key,
      required this.label,
      required this.value,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: textColor)),
        Text(label, style: Theme.of(context).textTheme.subtitle1),
        SizedBox(height: 20),
      ],
    );
  }
}
