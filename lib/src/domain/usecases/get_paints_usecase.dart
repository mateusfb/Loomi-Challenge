import 'package:get_it/get_it.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_paint_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/paint.dart';
import 'package:loomi_flutter_boilerplate/src/presentation/usecases/i_get_paints_usecase.dart';

class GetPaintsUseCase implements IGetPaintsUsecase {
  @override
  Future<List<Paint>> call() async {
    return GetIt.I.get<IPaintRepository>().getPaints();
  }
}