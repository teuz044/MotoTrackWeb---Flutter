import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ClassAppMasks {
  static final cpfMask = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static final cnpjMask = MaskTextInputFormatter(
    mask: '##.###.###/####-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static final cepMask = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static final telefoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static final dataMask = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static final timeMask = MaskTextInputFormatter(
    mask: '##:##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static final horaMinutoSegundoMask = MaskTextInputFormatter(
    mask: '##:##:##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  static final anoMask = MaskTextInputFormatter(
    mask: '####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  
  static final idCursoIESMask = MaskTextInputFormatter(
    mask: '############',
    filter: {'#': RegExp(r'[0-9]')},
  );
  
  static final notaMask = MaskTextInputFormatter(
    mask: '###',
    filter: {'#': RegExp(r'[fF0-9.]')},
  );

  static final pontuacaoMask = MaskTextInputFormatter(
    mask: '####',
    filter: {'#': RegExp(r'[fF0-9.]')},
  );
  
  static final percentualCargaHorariaSemipresencial = MaskTextInputFormatter(
    mask: '####',
    filter: {'#': RegExp(r'[fF0-9,]')},
  );
  
  static final numeroContaPlanoContasMask = MaskTextInputFormatter(
    mask: '#.##.##.##.##.####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  static final percentualMultaJuros = MaskTextInputFormatter(
    mask: '##.####',
    filter: {'#': RegExp(r'[0-9]')},
  );
}