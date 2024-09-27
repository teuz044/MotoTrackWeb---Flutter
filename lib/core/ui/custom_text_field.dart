import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String titulo;
  final Icon? icone;
  final int? maxLines;
  final bool? isRequired;
  final bool? enabled;
  final bool validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final double? borderRadius;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.titulo,
    this.icone,
    this.isRequired,
    this.maxLines,
    this.borderRadius,
    this.enabled,
    this.validator = false, this.inputFormatters, this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        
        enabled: widget.enabled ?? true,
        labelText: widget.titulo,
        suffixIcon: widget.icone,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(widget.borderRadius ?? 20)),
        ),
      ),
      validator: widget.validator == true
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'O campo é obrigatório.';
              }
              return null;
            }
          : null,
    );
  }
}
