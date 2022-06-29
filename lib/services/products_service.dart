import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:productos_app/models/models.dart';

import 'package:http/http.dart' as http;


class ProductsService extends ChangeNotifier {

  final String _baseUrl = 'flutter-varios-6f431-default-rtdb.firebaseio.com';

  final List<Product> products = []; 

  Product? selectedProduct;

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {

    isLoading = true;
    notifyListeners();
    
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode( resp.body );

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap( value );
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();

    return products;

  }

  Future saveOrCreateProduct ( Product product ) async {

    isSaving = true;
    notifyListeners();

    if ( product.id == null ) {

      await this.createProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct ( Product product ) async {

    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson() );

    final decodedData = resp.body;
    
    final index = this.products.indexWhere((element) => element.id == product.id );
    this.products[index] = product; 

    return product.id!;
    
  }

  Future<String> createProduct ( Product product ) async {

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson() );

    final decodedData = json.decode( resp.body );
    
    product.id = decodedData['name'];

    this.products.add( product );


    return product.id!;
    
  }


  void updateSelectedProductImage( String path ) {

    this.selectedProduct?.picture = path;
    this.newPictureFile = File.fromUri( Uri( path: path ));

    notifyListeners();

  }  

}