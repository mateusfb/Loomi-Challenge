import 'package:loomi_flutter_boilerplate/src/external/models/paint.dart';

abstract class IPaintRepository {
  Future<List<Paint>> getPaints();
}
