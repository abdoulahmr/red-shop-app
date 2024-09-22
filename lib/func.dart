import 'dart:convert';
import 'package:http/http.dart' as http;

// Function to fetch products from API
Future<List<dynamic>?> fetchProducts() async {
  final url = 'https://redshop.pythonanywhere.com/api/products'; 

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data; // Return the data as a Map
    } else {
      return null;
    }
  } catch (e) {
    
    return null;
  }
}

// Function to add an order
Future<bool> addOrder(Map<String, dynamic> order) async {
  final url = 'https://redshop.pythonanywhere.com/api/order'; 

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(order),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}