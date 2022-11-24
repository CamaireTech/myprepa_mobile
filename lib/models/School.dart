// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignoreforfile: publicmemberapidocs, sortconstructorsfirst
import 'dart:convert';

class School {
  final int? id;
  final String? name;
  final String? picture;
  final String? about;
  final String? phoneNumber;
  final String? fileMounting;
  final String? facebook;
  final String? website;
  final String? location;
  final int? domainId;
  final String? created_at;
  final String? updated_at;
  School({
    this.id,
    this.name,
    this.picture,
    this.about,
    this.phoneNumber,
    this.fileMounting,
    this.facebook,
    this.website,
    this.location,
     this.domainId,
    this.created_at,
    this.updated_at,
  });
 

  School copyWith({
    int? id,
    String? name,
    String? picture,
    String? about,
    String? phoneNumber,
    String? fileMounting,
    String? facebook,
    String? website,
    String? location,
    int? domainId,
    String? created_at,
    String? updated_at,
  }) {
    return School(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      about: about ?? this.about,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fileMounting: fileMounting ?? this.fileMounting,
      facebook: facebook ?? this.facebook,
      website: website ?? this.website,
      location: location ?? this.location,
      domainId: domainId ?? this.domainId,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  //  School.fromJson(Map<String,dynamic> map) 
  //    : id = map['id'] ?? 1 ,
  //     name= map['name'],
  //     picture = map['picture'] ,
  //     about= map['about'] ,
  //     phoneNumber= map['phoneNumber'],
  //     fileMounting= map['fileMounting']  ,
  //     facebook= map['facebook'] ,
  //     website= map['website'] ,
  //     location= map['location'] ,
  //     domainId= map['domainId'] ,
  //     created_at= map['created_at'] ,
  //     updated_at= map['updated_at'] ;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'picture': picture,
      'about': about,
      'phoneNumber': phoneNumber,
      'fileMounting': fileMounting,
      'facebook': facebook,
      'website': website,
      'location': location,
      'domainId': domainId,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      fileMounting: map['fileMounting'] != null ? map['fileMounting'] as String : null,
      facebook: map['facebook'] != null ? map['facebook'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      domainId: map['domainId'] != null ? map['domainId'] as int : null,
      created_at: map['created_at'] != null ? map['created_at'] as String : null,
      updated_at: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory School.fromJson(String source) => School.fromMap(json.decode(source) as Map<String, dynamic>);
}
