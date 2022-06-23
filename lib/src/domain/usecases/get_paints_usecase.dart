import 'package:get_it/get_it.dart';
import 'package:xtintas/src/domain/repositories/i_paint_repository.dart';
import 'package:xtintas/src/external/models/paint.dart';
import 'package:xtintas/src/presentation/usecases/i_get_paints_usecase.dart';

import '../../external/models/paints_response.dart';

class GetPaintsUseCase implements IGetPaintsUsecase {
  @override
  Future<PaintsResponse> call() async {
    return GetIt.I.get<IPaintRepository>().getPaints();
  }
}
