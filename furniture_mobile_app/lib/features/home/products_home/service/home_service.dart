import 'package:vexana/vexana.dart';

import '../../../../product/constants/api_endpoints.dart';
import '../../../../product/models/category_model.dart';
import '../../../../product/models/product_model.dart';

class HomeService implements IHomeService {
  final INetworkManager networkManager;

  static HomeService? _instance;

  static HomeService instance(INetworkManager networkManager) {
    _instance ??= HomeService._init(networkManager);
    return _instance!;
  }

  HomeService._init(this.networkManager);

  @override
  Future<IResponseModel<List<Category>?>> fetchCategories() async {
    final response = await networkManager.send<Category, List<Category>>(
        ApiEndpoints.Categories,
        parseModel: Category(),
        method: RequestType.GET
    );
    return response;
  }

  @override
  Future<IResponseModel<List<Product>?>> fetchProducts() async {
    final response = await networkManager.send<Product, List<Product>>(
        ApiEndpoints.Products,
        parseModel: Product(),
        method: RequestType.GET
    );
    return response;
  }
}

abstract class IHomeService {
  Future<IResponseModel<List<Category>?>> fetchCategories();

  Future<IResponseModel<List<Product>?>> fetchProducts();
}
