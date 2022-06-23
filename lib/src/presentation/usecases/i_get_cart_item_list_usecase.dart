import 'package:xtintas/src/external/models/cart_item.dart';

abstract class IGetCartItemListUsecase {
  Future<List<CartItem>> call();
}
