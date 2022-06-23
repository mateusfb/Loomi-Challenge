import 'package:dio/dio.dart';
import 'package:xtintas/src/domain/repositories/i_cart_repository.dart';
import 'package:xtintas/src/external/models/cart_item.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_datasource.g.dart';

@RestApi()
abstract class CartDatasource implements ICartRepository {
  factory CartDatasource(Dio dio, {String baseUrl}) = _CartDatasource;

  @override
  @POST('/cart')
  Future<void> postCartItem(@Body() CartItem cartItem);

  @override
  @DELETE('/cart/{id}')
  Future<void> deleteCartItem(@Path() String id);

  @override
  @GET('/cart')
  Future<List<CartItem>> getCartItemList();

  @override
  @PUT('/cart/{id}')
  Future<void> putCartItem(
      @Path() String id, @Body() Map<String, int> mapQuantity);
}
