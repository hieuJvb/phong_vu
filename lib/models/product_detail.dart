import 'package:json_annotation/json_annotation.dart';
import 'package:phong_vu/models/product_group.dart';

part 'product_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetail {
  String description;
  String shortDescription;
  List<AttributeGroup> attributeGroups;
  List<Image> images;
  ProductGroup productGroup;

  ProductDetail({
    required this.description,
    required this.shortDescription,
    required this.attributeGroups,
    required this.images,
    required this.productGroup

  });

  // Factory method to create an instance from JSON
  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

}


@JsonSerializable(explicitToJson: true)
class Image {
  String url;
  int priority;
  String label;

  Image({
    required this.url,
    required this.priority,
    required this.label,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}


@JsonSerializable(explicitToJson: true)
class AttributeGroup {
  int id;
  String name;
  String value;
  int priority;
  int parentId;

  AttributeGroup({
    required this.id,
    required this.name,
    required this.value,
    required this.priority,
    required this.parentId,
  });

  factory AttributeGroup.fromJson(Map<String, dynamic> json) =>
      _$AttributeGroupFromJson(json);

}
