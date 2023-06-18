import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SeatPreferenceWidget extends StatefulWidget {
  const SeatPreferenceWidget({super.key});

  @override
  State<SeatPreferenceWidget> createState() => _SeatPreferenceWidget();
}

class _SeatPreferenceWidget extends State<SeatPreferenceWidget> {
  Map<String, bool> preferenceValues = {
    'Window': true,
    'Aisle': false,
    'Middle': false,
  };

  var selectedOptionsArray = [];

  getCheckboxItems() {
    preferenceValues.forEach((key, value) {
      if (value == true) {
        selectedOptionsArray.add(key);
      }
    });
    debugPrint(selectedOptionsArray as String?);
    selectedOptionsArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          children: preferenceValues.keys.map((String key) {
            return CheckboxListTile(
              activeColor: kActiveCheckBoxBgColor,
              title: Text(key),
              value: preferenceValues[key],
              onChanged: (value) {
                setState(() {
                  preferenceValues[key] = value!;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
