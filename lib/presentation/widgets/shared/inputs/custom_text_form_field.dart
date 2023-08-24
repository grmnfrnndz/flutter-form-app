import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hintText,
      this.errorText,
      this.onChanged,
      this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      // borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(10),
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade400)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        focusColor: colors.primary,
        prefixIcon:
            Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        icon:
            Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        errorText: errorText,
      ),
    );
  }
}
