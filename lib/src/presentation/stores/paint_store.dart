import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paints_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/utils/misc.dart';
import 'package:mobx/mobx.dart';

import '../../external/models/paint.dart';
part 'paint_store.g.dart';

class PaintStore = _PaintStoreBase with _$PaintStore;

abstract class _PaintStoreBase with Store {
  @observable
  bool loading = false;

  @action
  Future<List<Paint>?> getPaints() async {
    try {
      loading = true;
      return GetIt.I.get<IGetPaintsUsecase>()();
    } catch (e, s) {
      printException("PaintStore.getPaints", e, s);
    } finally {
      loading = false;
    }
  }
}
