import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_cart_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_item.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_post_cart_item_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_put_cart_item_usecase.dart';

class PutCartItemUsecase implements IPutCartItemUsecase {
  @override
  Future<void> call(int id, Map<String, int> mapQuantity) async {
    return GetIt.I.get<ICartRepository>().putCartItem(id, mapQuantity);
  }
}
