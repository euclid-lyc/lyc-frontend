import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/posting/provider/coordi_provider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

class TempBox extends StatelessWidget {
  final String label;
  final Function(int) onChanged;

  const TempBox({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CoordiProvider>(
      builder: (context, provider, child) {
        int value = label == "최저기온" ? provider.minTemp : provider.maxTemp;
        return Expanded(
          child: GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                int tempValue = value;
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: Text('$label 선택'),
                      content: NumberPicker(
                        minValue: -99,
                        maxValue: 99,
                        value: tempValue,
                        onChanged: (newValue) {
                          setState(() {
                            tempValue = newValue;
                          });
                        },
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('취소'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: const Text('확인'),
                          onPressed: () {
                            onChanged(tempValue);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "$value°C",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}