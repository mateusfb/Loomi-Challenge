import 'package:loomi_flutter_boilerplate/src/external/models/cart_item.dart';

abstract class IGetCartItemListUsecase {
  Future<List<CartItem>> call();
}
