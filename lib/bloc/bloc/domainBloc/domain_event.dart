

import 'package:equatable/equatable.dart';

import '../../../models/Domain.dart';

abstract class DomainEvent extends Equatable {
  const DomainEvent();

  @override
  List<Object> get props => [];

}

  class AddDomains extends DomainEvent {
  final List<Domain> domains;
  const AddDomains({
    required this.domains,
  });
  @override
  List<Object> get props => [domains];
}