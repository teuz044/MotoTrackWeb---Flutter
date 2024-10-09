// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class LoginResponseModel {
  String codigo;
  LoginResponseModel({
    required this.codigo,
  });

  LoginResponseModel copyWith({
    String? codigo,
  }) {
    return LoginResponseModel(
      codigo: codigo ?? this.codigo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      codigo: map['codigo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) => LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponseModel(codigo: $codigo)';

  @override
  bool operator ==(covariant LoginResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.codigo == codigo;
  }

  @override
  int get hashCode => codigo.hashCode;
}
