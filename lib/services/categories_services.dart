import 'package:store_app/models/product_model.dart';
import '../helper/api.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String catrgoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$catrgoryName');
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
