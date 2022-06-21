import 'package:loomi_flutter_boilerplate/src/external/models/cart_item.dart';

abstract class ICartRepository {
  Future<void> postCartItem(CartItem cartItem);

  Future<void> deleteCartItem(int id);

  Future<List<CartItem>> getCartItemList();

  Future<void> putCartItem(int id, Map<String, int> mapQuantity);
}
