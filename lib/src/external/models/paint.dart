import 'benefit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paint.g.dart';

@JsonSerializable()
class Paint {
  final String name, image;
  final double price;
  final List<Benefit> benefits;

  const Paint(
      {this.name = '',
      this.image = '',
      this.price = 0,
      this.benefits = const []});

  factory Paint.fromJson(Map<String, dynamic> json) => _$PaintFromJson(json);

  Map<String, dynamic> toJson() => _$PaintToJson(this);
}
