import 'package:flutter/material.dart';

import '../utils/figma_space_to_percentage.dart';

class TextWithCheckbox extends StatefulWidget {
  final String text;
  final bool isChecked;
  final Function(bool) onChanged;

  const TextWithCheckbox({
    super.key,
    required this.text,
    required this.onChanged,
    required this.isChecked,
  });

  @override
  State<TextWithCheckbox> createState() => _TextWithCheckboxState();
}

class _TextWithCheckboxState extends State<TextWithCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: EdgeInsets.only(
              left: figmaSpaceToPercentageWidth(42, context),
              right: figmaSpaceToPercentageWidth(43, context)),
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
                          fontSize: figmaSpaceToPercentageHeight(16, context),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                          widget.onChanged(_isChecked);
                        });
                      },
                      child: Container(
                        width: figmaSpaceToPercentageWidth(18, context),
                        height: figmaSpaceToPercentageHeight(18, context),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                _isChecked ? Colors.transparent : Colors.black,
                            width: figmaSpaceToPercentageWidth(2, context),
                          ),
                          color: _isChecked
                              ? const Color.fromRGBO(96, 189, 52, 1)
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: figmaSpaceToPercentageHeight(8, context),
              ), // Add 10 pixels of height between widgets
            ],
          ),
        );
      },
    );
  }
}
