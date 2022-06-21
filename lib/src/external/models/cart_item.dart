import 'package:json_annotation/json_annotation.dart';

import 'package:loomi_flutter_boilerplate/src/external/models/paint.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  final Paint paint;
  final int quantity;
  final int id;

  CartItem({this.paint = const Paint(), this.quantity = 0, this.id = -1});

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
