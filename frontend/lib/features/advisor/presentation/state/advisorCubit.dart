import 'dart:developer';

import 'package:cherrystreet/features/advisor/data/repositories/advisor_repository_impl.dart';
import 'package:cherrystreet/features/advisor/presentation/state/advisorState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvisorCubit extends Cubit<AdvisorState> {
  final AdvisorRepositoryImpl advisorRepositoryImpl;

  AdvisorCubit(this.advisorRepositoryImpl) : super(AdvisorInitial());

  Future<void> fetchAdvisor() async {
    emit(AdvisorLoading());
    try {
      final data = await advisorRepositoryImpl.fetchAdvisor();
      log("Advisor fetched");
      emit(AdvisorFetched(data));
    } catch (e) {
      log('Error during authentication: $e');
      emit(AdvisorError());
    }
  }
}
