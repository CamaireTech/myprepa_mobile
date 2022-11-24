import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:jobsearch/bloc/bloc/schoolBloc/school_event.dart';
import '../../../models/School.dart';
import '../../bloc_export.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  SchoolBloc() : super(const SchoolState()) {
    on<AddSchools>(_onAddSchool);
  }

  FutureOr<void> _onAddSchool(event, Emitter<SchoolState> emit) {
    final state = this.state;
    final school = event.schools;
    emit(SchoolState(
        // allSchools: List.from(state.allSchools)..add(event.schools)
        allSchools: state.allSchools + event.schools
        
        ));
  }

}
