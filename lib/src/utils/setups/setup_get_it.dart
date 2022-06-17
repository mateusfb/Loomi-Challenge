import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_auth_repository.dart';
import 'package:loomi_flutter_boilerplate/src/domain/usecases/login_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/stores/auth_store.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_login_usecase.dart';

import '../../domain/repositories/i_example_repository.dart';
import '../../domain/usecases/get_example_uc.dart';
import '../../external/datasources/auth_datasource.dart';
import '../../external/datasources/example_datasource.dart';
import '../../presentation/stores/example_store.dart';
import '../../presentation/usecases/i_get_example_uc.dart';
import '../dio_config.dart';

void setupGetIt() {
  Dio dio = DioConfig().dio;
  //Stores
  GetIt.I.registerSingleton<ExampleStore>(ExampleStore());
  GetIt.I.registerSingleton<AuthStore>(AuthStore());

  //Datasources
  GetIt.I.registerSingleton<IExampleRepository>(ExampleDatasource(dio));
  GetIt.I.registerSingleton<IAuthRepository>(AuthDatasource(dio));

  //Usecases
  GetIt.I.registerSingleton<IGetExampleUseCase>(GetExampleUseCase());
  GetIt.I.registerSingleton<ILoginUseCase>(LoginUsecase());
}
