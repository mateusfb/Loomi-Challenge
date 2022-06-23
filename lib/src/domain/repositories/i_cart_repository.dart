import 'package:xtintas/src/external/models/cart_item.dart';

abstract class ICartRepository {
  Future<void> postCartItem(CartItem cartItem);

  Future<void> deleteCartItem(String id);

  Future<List<CartItem>> getCartItemList();

  Future<void> putCartItem(String id, Map<String, int> mapQuantity);
}
