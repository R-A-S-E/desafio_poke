import 'dart:convert';

class Failure {
  final String? message;
  final int? statusCode;

  Failure({
    this.message,
    this.statusCode,
  });

  Failure copyWith({
    String? message,
    int? statusCode,
  }) {
    return Failure(
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'statusCode': statusCode,
    };
  }

  factory Failure.fromMap(Map<String, dynamic> map) {
    return Failure(
      message: map['message'] != null ? map['message'] as String : null,
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Failure.fromJson(String source) =>
      Failure.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Failure(message: $message, statusCode: $statusCode)';

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) return true;

    return other.message == message && other.statusCode == statusCode;
  }

  @override
  int get hashCode => message.hashCode ^ statusCode.hashCode;
}
