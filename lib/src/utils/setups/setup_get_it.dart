import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xtintas/src/domain/repositories/i_auth_repository.dart';
import 'package:xtintas/src/domain/repositories/i_cart_repository.dart';
import 'package:xtintas/src/domain/repositories/i_paint_repository.dart';
import 'package:xtintas/src/domain/repositories/i_profile_repository.dart';
import 'package:xtintas/src/domain/repositories/i_user_repository.dart';
import 'package:xtintas/src/domain/usecases/delete_cart_item_usecase.dart';
import 'package:xtintas/src/domain/usecases/get_paints_usecase.dart';
import 'package:xtintas/src/domain/usecases/get_profile_usecase.dart';
import 'package:xtintas/src/domain/usecases/login_usecase.dart';
import 'package:xtintas/src/domain/usecases/logout_usecase.dart';
import 'package:xtintas/src/domain/usecases/post_cart_item_usecase.dart';
import 'package:xtintas/src/domain/usecases/put_card_item_usecase.dart';
import 'package:xtintas/src/domain/usecases/register_user_usecase.dart';
import 'package:xtintas/src/external/datasources/cart_datasource.dart';
import 'package:xtintas/src/external/datasources/paint_datasource.dart';
import 'package:xtintas/src/external/datasources/profile_datasource.dart';
import 'package:xtintas/src/external/datasources/user_datasource.dart';
import 'package:xtintas/src/presentation/stores/auth_store.dart';
import 'package:xtintas/src/presentation/stores/cart_store.dart';
import 'package:xtintas/src/presentation/stores/paint_store.dart';
import 'package:xtintas/src/presentation/stores/profile_store.dart';
import 'package:xtintas/src/presentation/stores/user_store.dart';
import 'package:xtintas/src/presentation/usecases/i_delete_cart_item_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_get_cart_item_list_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_get_paints_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_get_profile_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_login_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_logout_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_post_cart_item_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_put_cart_item_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_register_user_usecase.dart';

import '../../domain/usecases/get_cart_item_list_usecase.dart';
import '../../external/datasources/auth_datasource.dart';
import '../dio_config.dart';

void setupGetIt() {
  Dio dio = DioConfig().dio;
  //Stores
  GetIt.I.registerSingleton<AuthStore>(AuthStore());
  GetIt.I.registerSingleton<UserStore>(UserStore());
  GetIt.I.registerSingleton<PaintStore>(PaintStore());
  GetIt.I.registerSingleton<CartStore>(CartStore());
  GetIt.I.registerSingleton<ProfileStore>(ProfileStore());

  //Datasources
  GetIt.I.registerSingleton<IAuthRepository>(AuthDatasource(dio));
  GetIt.I.registerSingleton<IUserRepository>(UserDatasource(dio));
  GetIt.I.registerSingleton<IPaintRepository>(PaintDatasource(dio));
  GetIt.I.registerSingleton<ICartRepository>(CartDatasource(dio));
  GetIt.I.registerSingleton<IProfileRepository>(ProfileDatasource(dio));

  //Usecases
  GetIt.I.registerSingleton<ILoginUseCase>(LoginUsecase());
  GetIt.I.registerSingleton<IRegisterUserUseCase>(RegisterUserUsecase());
  GetIt.I.registerSingleton<IGetPaintsUsecase>(GetPaintsUseCase());
  GetIt.I.registerSingleton<IGetCartItemListUsecase>(GetCartItemListUsecase());
  GetIt.I.registerSingleton<IPostCartItemUsecase>(PostCartItemUsecase());
  GetIt.I.registerSingleton<IDeleteCartItemUsecase>(DeleteCartItemUsecase());
  GetIt.I.registerSingleton<IPutCartItemUsecase>(PutCartItemUsecase());
  GetIt.I.registerSingleton<IGetProfileUsecase>(GetProfileUsecase());
  GetIt.I.registerSingleton<ILogoutUsecase>(LogoutUsecase());
}
