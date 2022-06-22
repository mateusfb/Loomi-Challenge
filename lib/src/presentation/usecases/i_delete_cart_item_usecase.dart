import 'package:loomi_flutter_boilerplate/src/external/models/cart_item.dart';

abstract class IDeleteCartItemUsecase {
  Future<void> call(String id);
}
