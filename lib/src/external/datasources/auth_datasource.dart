import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_auth_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/auth_credentials_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_datasource.g.dart';

@RestApi()
abstract class AuthDatasource implements IAuthRepository {
  factory AuthDatasource(Dio dio, {String baseUrl}) = _AuthDatasource;

  @override
  @GET("/login")
  Future<String> login(@Body() AuthCredentials authCredentials);
}
