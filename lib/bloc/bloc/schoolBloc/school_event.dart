import 'package:equatable/equatable.dart';
import '../../../models/School.dart';

abstract class SchoolEvent extends Equatable {
  const SchoolEvent();

  @override
  List<Object> get props => [];
}

class AddSchools extends SchoolEvent {
  final List<School> schools;
  const AddSchools({
    required this.schools,
  });
  @override
  List<Object> get props => [schools];
}







class DeleteSchools extends SchoolEvent {
  final School schools;
  const DeleteSchools({
    required this.schools,
  });
  @override
  List<Object> get props => [schools];
}


