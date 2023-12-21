import 'package:coptix/shared/theme/colors.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';

class CoptixTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final TextInputType? keyboardType;

  const CoptixTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType,
  });
  @override
  State<CoptixTextFormField> createState() => _CoptixTextFormFieldState();
}

class _CoptixTextFormFieldState extends State<CoptixTextFormField> {
  bool _isPasswordVisible = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocused = hasFocus;
        });
      },
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            labelText: widget.labelText,
            floatingLabelStyle: _isFocused
                ? inputTextStyle.copyWith(color: secondaryColor)
                : inputTextStyle,
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: lightColor,
                    ),
                  )
                : null),
        obscureText: widget.isPassword && !_isPasswordVisible,
        keyboardType: widget.isPassword
            ? TextInputType.visiblePassword
            : widget.keyboardType,
      ),
    );
  }
}
