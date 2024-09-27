// ignore_for_file: invalid_use_of_protected_member, prefer_final_locals, no_leading_underscores_for_local_identifiers
import 'dart:convert';
import 'package:flutter/material.dart';

import 'class_estilos_texto.dart';

class ClassDropdownButton {
  //Lista de itens gerenciada pela classe
  final List<ClassDropdownButtonItem> _lstItems = [];

  //Variável auxiliar utilizada para armazenar o item selecionado
  ClassDropdownButtonItem selectedItem = ClassDropdownButtonItem();

  //Retorna widget
  Widget getWidget(
    State sttState,
    String label, {
    double height = 25,
    double size = 0.25,
    Color? borderColor,
    VoidCallback? onPressed,
  }) {
    return InputDecorator(
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Colors.red,
          ),
        ),
        contentPadding: const EdgeInsets.all(11.0),
        labelText: '   $label   ',
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          focusColor: Colors.transparent,
          isExpanded: true,
          value: selectedItem,
          items: getAllItems(),
          onChanged: (newValue) {
            sttState.setState(() {
              selectedItem = newValue!;
              onPressed != null ? onPressed() : onPressed;
            });
          },
        ),
      ),
    );
  }

  //Adiciona novo item à lista
  void itemAdd(String value, String text) {
    final newItem = ClassDropdownButtonItem();
    newItem.value = value;
    newItem.text = text;
    _lstItems.add(newItem);
  }

  void clear() {
    _lstItems.clear();
  }

  //PEGA O VALOR DO DORPDONW
  String getValue() {
    return selectedItem.value ?? '';
  }

  int getSelectedIndex() {
    return _lstItems.indexOf(selectedItem);
  }

  //PEGA O TEXTO DO DORPDONW

  //SELECIONA ITEM PELO SEU value
  void setValue(State sttState, String value) {
    ClassDropdownButtonItem item = ClassDropdownButtonItem();

    item = _lstItems.firstWhere(
      (element) => element.value == value,
      orElse: () {
        return ClassDropdownButtonItem();
      },
    );

    sttState.setState(() {
      setSelectedItem(item);
    });
  }
  //PEGA O TEXTO DO DORPDONW

  String getText() {
    return selectedItem.text ?? '';
  }

  //Atribui item selecionado pelo objeto
  void setSelectedItem(ClassDropdownButtonItem _selectedItem) {
    selectedItem = _selectedItem;
  }

  //Atribui primeiro item da lista à variável de controle do item selecionado
  void selectFirst() {
    selectedItem = _lstItems.first;
  }

  //Retorna um mapa dos itens de objeto da lista
  List<DropdownMenuItem<ClassDropdownButtonItem>> getAllItems() {
    return _lstItems.map<DropdownMenuItem<ClassDropdownButtonItem>>(
      (ClassDropdownButtonItem value) {
        return DropdownMenuItem<ClassDropdownButtonItem>(
          value: value,
          child: Text(
            value.text ?? '',
            style: ClassEstilosTextos.pretoSize18w400Montserrat,
          ),
        );
      },
    ).toList();
  }

  //Adiciona itens a partir de uma lista de objetos
  dynamic loadFromObjectList(
    List<dynamic> lstObjectList,
    String valueField,
    String textFields,
    String seNulo,
  ) {
    String textFieldContent;

    final fields = textFields.split('/');

    try {
      //LAÇO DA LISTA DE OBJETOS
      for (var itemObject in lstObjectList) {
        //VARIÁVEIS DE CONVERSÃO
        var itemObjectEncode = jsonEncode(itemObject);
        var itemObjectDecode = jsonDecode(itemObjectEncode);

        Map item = jsonDecode(itemObjectDecode);

        //OBTEM OS CAMPOS DE TEXTO A SEREM ADICIONADOS À PROPRIEDADE textfield DO DROPDOWN
        textFieldContent = '';
        for (var element in fields) {
          if (item.containsKey(element)) {
            if (item[element].toString() == 'null') {
              textFieldContent = textFieldContent + seNulo;
            } else {
              textFieldContent = textFieldContent + item[element].toString();
            }
          } else {
            textFieldContent = textFieldContent + element;
          }
        }

        //ADICIONA ITEM À LISTA DO DROPDOWN
        itemAdd(item[valueField].toString(), textFieldContent);
      }
    } catch (error) {
      //! Para debug apenas...
      error.toString();
    }
    //SELECIONA PRIMEIRO ITEM
    selectFirst();
  }

 
  void getGenerosMusicais() {
    clear();
    itemAdd('0', 'Pop');
    itemAdd('1', 'Rock');
    itemAdd('2', 'Funk');

    selectFirst();
  }

}

class ClassDropdownButtonItem {
  String? value;
  String? text;

  ClassDropdownButtonItem({
    this.value,
    this.text,
  });
}
