import 'package:json_annotation/json_annotation.dart';

import 'paint.dart';

part 'paints_response.g.dart';

@JsonSerializable()
class PaintsResponse {
  final int count;
  final List<Paint> data;

  PaintsResponse({this.count = 0, this.data = const []});

  factory PaintsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaintsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaintsResponseToJson(this);
}
