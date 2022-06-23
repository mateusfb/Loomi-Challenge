import 'package:get_it/get_it.dart';
import 'package:xtintas/src/domain/repositories/i_cart_repository.dart';
import 'package:xtintas/src/external/models/cart_item.dart';
import 'package:xtintas/src/presentation/usecases/i_get_cart_item_list_usecase.dart';
import 'package:xtintas/src/presentation/usecases/i_post_cart_item_usecase.dart';

class GetCartItemListUsecase implements IGetCartItemListUsecase {
  @override
  Future<List<CartItem>> call() async {
    return GetIt.I.get<ICartRepository>().getCartItemList();
  }
}
