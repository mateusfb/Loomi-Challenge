import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_user_repository.dart';
import 'package:retrofit/http.dart';

import '../models/user_register_info.dart';

part 'user_datasource.g.dart';

@RestApi()
abstract class UserDatasource implements IUserRepository {
  factory UserDatasource(Dio dio, {String baseUrl}) = _UserDatasource;

  @override
  @POST('/user')
  Future<void> registerUser(@Body() UserRegisterInfo info);
}
