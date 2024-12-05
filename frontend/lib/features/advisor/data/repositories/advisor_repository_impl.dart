import 'dart:developer';

import 'package:cherrystreet/features/advisor/data/data_sources/remote_datasource.dart';
import 'package:cherrystreet/features/advisor/data/models/advisor_model.dart';
import 'package:cherrystreet/features/advisor/domain/repositories/advisor_repository.dart';

class AdvisorRepositoryImpl implements AdvisorRepository {
  final AdvisorRemoteDataSource remoteDataSource;

  AdvisorRepositoryImpl(this.remoteDataSource);

  @override
  Future<AdvisorModel> fetchAdvisor() async {
    try {
      return await remoteDataSource.fetchAdvisor();
    } catch (e) {
      log("Error fetching advisor");
      rethrow;
    }
  }
}
