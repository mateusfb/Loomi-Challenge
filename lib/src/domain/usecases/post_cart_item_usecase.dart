import 'package:get_it/get_it.dart';
import 'package:xtintas/src/domain/repositories/i_cart_repository.dart';
import 'package:xtintas/src/external/models/cart_item.dart';
import 'package:xtintas/src/presentation/usecases/i_post_cart_item_usecase.dart';

class PostCartItemUsecase implements IPostCartItemUsecase {
  @override
  Future<void> call(CartItem cartItem) async {
    return GetIt.I.get<ICartRepository>().postCartItem(cartItem);
  }
}
