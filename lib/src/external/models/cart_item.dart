import 'package:json_annotation/json_annotation.dart';

import 'package:xtintas/src/external/models/paint.dart';

part 'cart_item.g.dart';

@JsonSerializable(includeIfNull: false)
class CartItem {
  final Paint paint;
  final int quantity;
  final String? id;

  CartItem({this.paint = const Paint(), this.quantity = 0, this.id});

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
