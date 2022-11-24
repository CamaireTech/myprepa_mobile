import 'dart:async';
import 'package:equatable/equatable.dart';
import '../../../models/Domain.dart';
import '../../bloc_export.dart';
import 'domain_event.dart';
import 'domain_state.dart';

class DomainBloc extends Bloc<DomainEvent, DomainState> {
  DomainBloc() : super(const DomainState()) {
    on<AddDomains>(_onAddDomain);
  }

  FutureOr<void> _onAddDomain(event, Emitter<DomainState> emit) {
    final state = this.state;
    final domains = event.domains;
    emit(DomainState(
        // allDomains: List.from(state.allDomains)..add(event.Domains)
        allDomains: state.allDomains + domains
        
        ));
  }

}