import '../helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getAllCategries() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
