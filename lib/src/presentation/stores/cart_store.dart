import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/cart_item.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_delete_cart_item_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_cart_item_list_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_post_cart_item_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_put_cart_item_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/utils/misc.dart';
import 'package:mobx/mobx.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  @observable
  bool loading = false;

  @action
  Future<void> postCartItem(CartItem cartItem) async {
    try {
      loading = true;
      return await GetIt.I.get<IPostCartItemUsecase>()(cartItem);
    } catch (e, s) {
      printException("CartStore.postCartItem", e, s);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> deleteCartItem(int id) async {
    try {
      loading = true;
      return await GetIt.I.get<IDeleteCartItemUsecase>()(id);
    } catch (e, s) {
      printException("CartStore.deleteCartItem", e, s);
    } finally {
      loading = false;
    }
  }

  @action
  Future<List<CartItem>?> getCartItemList() async {
    try {
      loading = true;
      return await GetIt.I.get<IGetCartItemListUsecase>()();
    } catch (e, s) {
      printException("CartStore.getCartItemList", e, s);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> putCartItem(int id, int quantity) async {
    try {
      loading = true;
      var map = {'quantity': quantity};
      return await GetIt.I.get<IPutCartItemUsecase>()(id, map);
    } catch (e, s) {
      printException("CartStore.putCartItem", e, s);
    } finally {
      loading = false;
    }
  }
}
