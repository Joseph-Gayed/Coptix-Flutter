import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';

class RadioList extends StatelessWidget {
  //map <option title , option value>
  final Map<String, String> options;
  final void Function(String value) onSelectionValueChanged;

  final String selectedOption;

  const RadioList(
      {super.key,
      required this.options,
      required this.onSelectionValueChanged,
      required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: getOptionsWidget(),
    );
  }

  List<Widget> getOptionsWidget() {
    return options.keys.map((optionTitle) {
      return Container(
        color: primaryColor,
        margin: const EdgeInsets.only(
            top: Dimens.halfScreenMargin, bottom: Dimens.halfScreenMargin),
        child: RadioListTile(
          title: Text(optionTitle),
          value: options[optionTitle]!,
          groupValue: selectedOption,
          onChanged: (value) {
            if (value != null) onSelectionValueChanged(value);
          },
        ),
      );
    }).toList();
  }
}
