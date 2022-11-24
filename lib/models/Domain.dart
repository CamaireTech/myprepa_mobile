import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Domain {
  int id;
  String? domainName;
  final String? created_at;
  final String? updated_at;
  Domain({
    required this.id,
    this.domainName,
    this.created_at,
    this.updated_at,
  });
 

  Domain copyWith({
    int? id,
    String? domainName,
    String? created_at,
    String? updated_at,
  }) {
    return Domain(
      id: id ?? this.id,
      domainName: domainName ?? this.domainName,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'domainName': domainName,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory Domain.fromMap(Map<String, dynamic> map) {
    return Domain(
      id: map['id'] as int,
      domainName: map['domainName'] != null ? map['domainName'] as String : null,
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Domain.fromJson(String source) => Domain.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Domain(id: $id, domainName: $domainName, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant Domain other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.domainName == domainName &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      domainName.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}
