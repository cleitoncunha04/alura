import 'package:flutter/material.dart';
import 'package:getx_api_project/utils/colors_utils.dart';

class CustomFieldComponent extends StatelessWidget {
  const CustomFieldComponent(
      {super.key, required this.label, required this.textController});
  final String label;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: ColorsUtils.blueAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextFormField(
          controller: textController,
          decoration: InputDecoration(
            constraints: const BoxConstraints(
              maxHeight: 40,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 2.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: ColorsUtils.mediumGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
