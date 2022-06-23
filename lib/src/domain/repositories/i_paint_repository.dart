import 'package:xtintas/src/external/models/paint.dart';

import '../../external/models/paints_response.dart';

abstract class IPaintRepository {
  Future<PaintsResponse> getPaints();
}
