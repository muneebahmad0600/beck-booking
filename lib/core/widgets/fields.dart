import 'package:beck_booking/core/widgets/validator.dart';
import 'package:flutter/material.dart';

class Fields {
  static getTextField(TextEditingController controller, String label,
      bool obscureText, IconData icon) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) {
          return Validators.textFieldNullValidator(value);
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: label,
            prefixIcon: Icon(icon)));
  }
}
