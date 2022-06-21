import 'package:json_annotation/json_annotation.dart';

part 'benefit.g.dart';

@JsonSerializable()
class Benefit {
  final String name, icon;

  Benefit({this.name = "", this.icon = ""});

  factory Benefit.fromJson(Map<String, dynamic> json) =>
      _$BenefitFromJson(json);

  Map<String, dynamic> toJson() => _$BenefitToJson(this);
}
