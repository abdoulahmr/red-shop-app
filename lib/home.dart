import 'package:ecomapp/func.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic>? products;

  @override
  void initState() {
    super.initState();
    fetchProducts().then((data) {
      setState(() {
        products = data;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Center(
        child: products == null
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products![index]['title']),
                    subtitle: Text(products![index]['price'].toString()),
                  );
                },
              ),
      )
    );
  }
}
