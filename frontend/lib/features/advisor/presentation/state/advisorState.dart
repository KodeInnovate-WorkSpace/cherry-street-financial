import 'package:cherrystreet/features/advisor/data/models/advisor_model.dart';

abstract class AdvisorState {}

class AdvisorInitial extends AdvisorState {}

class AdvisorLoading extends AdvisorState {}

class AdvisorFetched extends AdvisorState {
  final AdvisorModel advisor;

  AdvisorFetched(this.advisor);
}

class AdvisorError extends AdvisorState {}
