import 'package:dio/dio.dart';
import 'package:xtintas/src/domain/repositories/i_profile_repository.dart';
import 'package:retrofit/http.dart';

import '../models/profile.dart';

part 'profile_datasource.g.dart';

@RestApi()
abstract class ProfileDatasource implements IProfileRepository {
  factory ProfileDatasource(Dio dio, {String baseUrl}) = _ProfileDatasource;

  @override
  @GET('/profile')
  Future<Profile> getProfile();
}
