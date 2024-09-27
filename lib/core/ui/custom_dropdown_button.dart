
import 'package:flutter/material.dart';

class ClassCustomDropDown extends StatelessWidget {
  final String itemSelecionado;
  final List<String> lstItens;
  final ValueChanged<String?> onChanged;
  final String titulo;
  final double porcentagemLargura;

  const ClassCustomDropDown({
    super.key,
    required this.itemSelecionado,
    required this.lstItens,
    required this.onChanged, required this.titulo, required this.porcentagemLargura,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * porcentagemLargura, // D
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(titulo),
          ),
          value: itemSelecionado,
          onChanged: onChanged,
          items: lstItens.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(value),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}