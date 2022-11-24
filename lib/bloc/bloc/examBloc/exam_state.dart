part of 'exam_bloc.dart';

abstract class ExamState extends Equatable {
  const ExamState();
  
  @override
  List<Object> get props => [];
}

class ExamInitial extends ExamState {}
