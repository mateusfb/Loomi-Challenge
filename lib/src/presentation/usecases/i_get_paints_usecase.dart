import '../../external/models/paint.dart';

abstract class IGetPaintsUsecase {
  Future<List<Paint>> call();
}
