import 'package:flutter/material.dart';
import 'package:task_manager_app/utils/colors.dart';

class CustomFormField extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const CustomFormField({
    super.key,
    this.MaxLines = 1,
    this.maxLength = 30,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.controller,
    required this.hintText,
  });

  final int MaxLines;
  final int maxLength;
  final String hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onFieldSubmitted;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        counter: Text('0/20'),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        fillColor: AppColors.darkGrey,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.secondaryColor,
            strokeAlign: 2,
            width: BorderSide.strokeAlignOutside,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: TextStyle(color: Colors.red),
        hint: Text(hintText, style: TextStyle(color: AppColors.whiteColor)),
        enabled: true,
      ),
      cursorColor: AppColors.whiteColor,
      smartDashesType: SmartDashesType.enabled,
      smartQuotesType: SmartQuotesType.enabled,
      style: TextStyle(color: AppColors.whiteColor),
      maxLines: MaxLines,
      maxLength: maxLength,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,

      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter some text';
        }
        if (value.trim().length < 3) {
          return 'Title must be at least 3 characters';
        }
        return null; // ← null = valid!
      },
      onSaved: (value) {},
    );
  }
}
