import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? prevFocusNode;

  const OtpField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.prevFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15);

    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: Colors.black, // Set cursor color to black
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Set text color to black
        ),
        decoration: InputDecoration(
          // Define the enabled border color (when not focused)
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: Colors.orangeAccent.withOpacity(0.4), width: 2),
          ),
          // Define the focused border color (when focused)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
          ),
          counterText: "",
        ),
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onTap: () {
          // Ensure cursor is at the end of the text field
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (nextFocusNode != null) {
              // Move focus to the next field if available
              FocusScope.of(context).requestFocus(nextFocusNode);
            } else {
              // No next field, so unfocus and close the keyboard
              FocusScope.of(context).unfocus();
            }
          } else if (value.isEmpty && prevFocusNode != null) {
            // Move focus to the previous field if backspacing
            FocusScope.of(context).requestFocus(prevFocusNode);
          }
        },
        onFieldSubmitted: (_) {
          // Unfocus if the field is empty when submitted and it’s the last field
          if (controller.text.isEmpty && prevFocusNode != null) {
            FocusScope.of(context).requestFocus(prevFocusNode);
          }
        },
      ),
    );
  }
}
