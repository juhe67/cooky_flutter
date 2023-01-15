import '../data_sources/remote/product_remote_data_source.dart';
import '../models/product_model.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.productRemoteDataSource});

  final ProductRemoteDataSource productRemoteDataSource;

  @override
  Future<List<ProductModel>> fetch() async {
    return await productRemoteDataSource.fetch();
  }
}
