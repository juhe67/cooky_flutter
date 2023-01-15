import '../../domain/entity/product_entity.dart';

/// Instance of class [ProductEntity] which has the role of fetching and parsing data from/to json.
class ProductModel extends ProductEntity {
  /// Fetch data from json format.
  ProductModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          name: json['name'],
          description: json['description'],
        );

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'weather': {
          'id': id,
          'name': name,
          'description': description,
        },
      };
}
