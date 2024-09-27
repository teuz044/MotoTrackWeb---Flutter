import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ClassGenericResponse {
  final int? statusCode;
  final String? message;
  ClassGenericResponse({
    this.statusCode,
    this.message,
  });


  ClassGenericResponse copyWith({
    int? statusCode,
    String? message,
  }) {
    return ClassGenericResponse(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
    };
  }

  factory ClassGenericResponse.fromMap(Map<String, dynamic> map) {
    return ClassGenericResponse(
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassGenericResponse.fromJson(String source) => ClassGenericResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ClassGenericResponse(statusCode: $statusCode, message: $message)';

  @override
  bool operator ==(covariant ClassGenericResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.statusCode == statusCode &&
      other.message == message;
  }

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode;
}
