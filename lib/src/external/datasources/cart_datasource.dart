import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_cart_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_item.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_datasource.g.dart';

@RestApi()
abstract class CartDatasource implements ICartRepository {
  factory CartDatasource(Dio dio, {String baseUrl}) = _CartDatasource;

  @override
  @POST('/cart')
  Future<void> postCartItem(CartItem cartItem);

  @override
  @DELETE('/cart/{id}')
  Future<void> deleteCartItem(@Path() int id);

  @override
  @GET('/cart')
  Future<List<CartItem>> getCartItemList();

  @override
  @PUT('/cart/{id}')
  Future<void> putCartItem(
      @Path() int id, @Body() Map<String, int> mapQuantity);
}
