import 'package:coptix/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../theme/styles.dart';

// ignore: must_be_immutable
class CoptixTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final StringValidationCallback? validator;

  CoptixTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType,
    this.validator,
  });

  late _CoptixTextFormFieldState _state;
  @override
  // ignore: no_logic_in_create_state
  State<CoptixTextFormField> createState() {
    _state = _CoptixTextFormFieldState();
    return _state;
  }

  bool isValid(BuildContext context) {
    return _state.isValidInput();
  }
}

class _CoptixTextFormFieldState extends State<CoptixTextFormField> {
  bool _isPasswordVisible = false;
  bool _isFocused = false;

  String? validationText;

  bool isValidInput() {
    if (widget.validator != null) {
      final result = widget.validator!(widget.controller.text);
      setState(() {
        validationText = result;
      });
      return result == null;
    }
    return true;
  }

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
            helperText: validationText,
            helperStyle: lightTextStyle.copyWith(color: Colors.red),
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
        validator: widget.validator,
      ),
    );
  }
}
