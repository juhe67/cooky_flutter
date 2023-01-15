import 'package:dio/dio.dart';
import '../../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetch();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<ProductModel>> fetch() async {
    try {
      List<ProductModel> listProduct = [];
      final response = await dio
          .get('http://localhost/cooky_flutter/server/api/product/fetch.php');
      for (var data in response.data['data']) {
        ProductModel product = ProductModel.fromJson(data);
        listProduct.add(product);
      }
      return listProduct;
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
