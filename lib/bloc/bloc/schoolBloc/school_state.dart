part of 'school_bloc.dart';

 class SchoolState extends Equatable {
   final List<School> allSchools;

  const SchoolState({this.allSchools = const <School>[],});
  
  @override
  List<Object> get props => [allSchools];
}

