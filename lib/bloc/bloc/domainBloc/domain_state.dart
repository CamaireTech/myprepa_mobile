

import 'package:equatable/equatable.dart';

import '../../../models/Domain.dart';

class DomainState extends Equatable {
  final List<Domain> allDomains;
  const DomainState({this.allDomains=const <Domain>[],}
  );
  
  @override
  List<Object> get props => [allDomains];
}


