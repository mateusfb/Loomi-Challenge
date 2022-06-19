import 'package:dio/dio.dart';
import 'package:loomi_flutter_boilerplate/src/domain/repositories/i_paint_repository.dart';
import 'package:loomi_flutter_boilerplate/src/external/models/paint.dart';
import 'package:retrofit/retrofit.dart';

import '../models/paints_response.dart';

part 'paint_datasource.g.dart';

@RestApi()
abstract class PaintDatasource implements IPaintRepository {
  factory PaintDatasource(Dio dio, {String baseUrl}) = _PaintDatasource;

  @override
  @GET("/paints")
  Future<PaintsResponse> getPaints();
}
