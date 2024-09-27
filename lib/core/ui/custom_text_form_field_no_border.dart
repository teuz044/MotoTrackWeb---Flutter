import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rifa_projeto_desktop/core/ui/class_estilos_texto.dart';

class CustomTextFormFieldNoBorderWidget extends StatelessWidget {
  final String titulo;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final bool validator;
  final double? width, height, fontSize;
  final bool enabled;
  final int? length;
  final int? maxLines;
  final bool? obscureText;
  final Color? borderColor;
  final TextOverflow? overflow;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomTextFormFieldNoBorderWidget({
    super.key,
    required this.titulo,
    this.controller,
    this.textInputAction,
    this.textInputType,
    this.initialValue,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.width,
    this.height,
    this.fontSize,
    this.length,
    this.maxLines,
    this.validator = false,
    this.enabled = true,
    this.obscureText = false,
    this.overflow,
    this.borderColor,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.lightBlue, blurRadius: 0)],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: TextFormField(
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          obscureText: obscureText ?? false,
          onFieldSubmitted: onFieldSubmitted,
           autofocus: true,
          initialValue: initialValue,
          controller: controller,
          enabled: enabled,
          keyboardType: textInputType ?? TextInputType.multiline,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            label: Text(
              titulo,
              style: ClassEstilosTextos.pretoSize16w600Montserrat,
              overflow: overflow ?? TextOverflow.visible,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          style: TextStyle(
            fontSize: fontSize ?? 20.0,
          ),
          validator: validator == true
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'O campo é obrigatório.';
                  }
                  return null;
                }
              : null,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
