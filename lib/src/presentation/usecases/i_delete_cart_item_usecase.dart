import 'package:xtintas/src/external/models/cart_item.dart';

abstract class IDeleteCartItemUsecase {
  Future<void> call(String id);
}
