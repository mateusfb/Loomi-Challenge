import '../../external/models/paint.dart';
import '../../external/models/paints_response.dart';

abstract class IGetPaintsUsecase {
  Future<PaintsResponse> call();
}
