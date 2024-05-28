import 'package:flutter/material.dart';
import '../utils/figma_space_to_percentage.dart';
class TextWithCheckbox extends StatefulWidget {
  final String text;

  const TextWithCheckbox({Key? key, required this.text}) : super(key: key);

  @override
  _TextWithCheckboxState createState() => _TextWithCheckboxState();
}

class _TextWithCheckboxState extends State<TextWithCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: EdgeInsets.only(left: figmaSpaceToPercentageWidth(42, context), right:figmaSpaceToPercentageWidth(43, context) ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        fontSize: figmaSpaceToPercentage(16, context),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none
                      ),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                          print('$isChecked');
                        });
                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(18, context),
                        height: figmaSpaceToPercentage(18, context),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isChecked ? Colors.transparent : Colors.black,
                            width: figmaSpaceToPercentageWidth(2, context),
                          ),
                          color: isChecked ? Color.fromRGBO(96, 189, 52, 1) : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: figmaSpaceToPercentage(8, context)), // Add 10 pixels of height between widgets
            ],
          ),
        );
      },
    );
  }
}
