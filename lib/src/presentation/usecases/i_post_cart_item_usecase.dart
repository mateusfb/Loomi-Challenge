import 'package:xtintas/src/external/models/cart_item.dart';

abstract class IPostCartItemUsecase {
  Future<void> call(CartItem cartItem);
}
