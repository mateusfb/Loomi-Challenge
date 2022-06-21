import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paints_usecase.dart';
import 'package:loomi_flutter_boilerplate/src/utils/misc.dart';
import 'package:mobx/mobx.dart';

import '../../external/models/paint.dart';
import '../../external/models/paints_response.dart';
part 'paint_store.g.dart';

class PaintStore = _PaintStoreBase with _$PaintStore;

abstract class _PaintStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  int selectedPaint = 0;

  @action
  changeSelectedPaint(int selectedPaint) {
    this.selectedPaint = selectedPaint;
  }

  @action
  Future<List<Paint>?> getPaints() async {
    try {
      List<Paint> list = [];

      loading = true;
      PaintsResponse response = await GetIt.I.get<IGetPaintsUsecase>()();

      return response.data;
    } catch (e, s) {
      printException("PaintStore.getPaints", e, s);
    } finally {
      loading = false;
    }
  }
}
