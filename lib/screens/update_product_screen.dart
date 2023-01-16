// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_text_filed.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static const String updateProductScreenRoute = 'updateProduct';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFiled(
                  onChanged: (value) {
                    productName = value;
                  },
                  obscureText: false,
                  hintText: 'Product Name',
                ),
                SizedBox(
                  height: 18,
                ),
                CustomTextFiled(
                  onChanged: (value) {
                    description = value;
                  },
                  obscureText: false,
                  hintText: 'description',
                ),
                SizedBox(
                  height: 18,
                ),
                CustomTextFiled(
                  type: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  },
                  obscureText: false,
                  hintText: 'price',
                ),
                SizedBox(
                  height: 18,
                ),
                CustomTextFiled(
                  onChanged: (value) {
                    description = value;
                  },
                  obscureText: false,
                  hintText: 'image',
                ),
                SizedBox(
                  height: 28,
                ),
                ElevatedButton(
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print('Sucsess');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id!,
        title: productName == null ? product.title! : productName!,
        price: price == null ? product.price.toString() : price!,
        description: description == null ? product.description! : description!,
        image: image == null ? product.image! : image!,
        category: product.category!);
  }
}
