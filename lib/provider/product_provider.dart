import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test/model/get_product_detail_model.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier{
  late List<GetProductDetails> _getProductDetails = [];
  
  List<GetProductDetails> get getProductDetails => _getProductDetails;
  
  
  Future<void> getProductAPI() async{
    try{
      var response = await http.get(
          Uri.parse("https://www.indiacart.ca/webbeta/public/api/categories?pagination=0")
      ).timeout(const Duration(seconds: 30));
      print(response.body);
      Map<String, dynamic> json = jsonDecode(response.body) as Map<String, dynamic>;
      if(response.statusCode == 200){
        _getProductDetails = [];
        final GetProductDetailsModel _displayModel = GetProductDetailsModel.fromJson(json);
        _getProductDetails = _displayModel.data!;
      }
      notifyListeners();
      return;
    }catch(e){
      print(e);
    }
  }
}