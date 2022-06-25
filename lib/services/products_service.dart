import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:productos_app/models/models.dart';

import 'package:http/http.dart' as http;


class ProductsService extends ChangeNotifier {

  final String _baseUrl = 'flutter-varios-6f431-default-rtdb.firebaseio.com';

  final List<Product> products = []; 

  bool isLoading = true;

  ProductsService() {
    loadProducts();
  }

  Future loadProducts() async {
    
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode( resp.body );

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap( value );
      tempProduct.id = key;
      products.add(tempProduct);
    });

    print(products[0].name); 

  }

}