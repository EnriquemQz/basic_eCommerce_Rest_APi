import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {

  Future productsBanner() async {
    final response = await http.get(Uri.https('dummyjson.com', 'products'));
    final body = jsonDecode(response.body);
    return body;
  }

  Future categories() async {
    final response = await http.get(Uri.https(
      'dummyjson.com', 'products/categories'
    ));
    final body = jsonDecode(response.body);
    return body;
  }

  Future bestSeller() async {
    final response = await http.get(
      Uri.https('dummyjson.com', 'products', 
      {
        'limit': '6',
        'skip' : '10'
      }
    ));
    final body = jsonDecode(response.body);
    return body;
  }

  Future bestRating() async {                        
    final response = await http.get(
      Uri.https('dummyjson.com', 'products',
      {'select': 'thumbnail,description,rating'}
    ));
    final body = jsonDecode(response.body);
    return body;
  }
} 