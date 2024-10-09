import 'package:flutter/material.dart';

class CustomTextFieldLogin extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final bool isRequired;
  final bool enabled;
  final bool isObscure;

  const CustomTextFieldLogin({
    super.key,
    required this.labelText,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.isRequired = false, // Campo obrigatório opcional
    this.enabled = true, // Campo habilitado/desabilitado opcional
    this.isObscure = false, // Controle de visibilidade do texto
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled, // Controla se o campo está habilitado ou não
      obscureText: isObscure, // Controla a exibição do texto
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'Este campo é obrigatório';
        }
        return null;
      },
    );
  }
}
