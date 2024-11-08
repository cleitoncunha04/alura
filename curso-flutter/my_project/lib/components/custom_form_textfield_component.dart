import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController customTextFormFieldController;
  final String textHint;
  final IconData iconData;

  const CustomTextFormField({
    required this.customTextFormFieldController,
    required this.textHint,
    required this.iconData,
    super.key,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: widget.customTextFormFieldController,
        onChanged: (text) {
          setState(() {});
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 5,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          suffixIcon: Icon(
            widget.iconData,
            color: Colors.black,
          ),
          label: Text(
            widget.textHint,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
