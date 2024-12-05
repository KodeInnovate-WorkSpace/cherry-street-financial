import 'package:cherrystreet/features/advisor/data/models/advisor_model.dart';

abstract interface class AdvisorRepository {
  Future<AdvisorModel> fetchAdvisor();
}
