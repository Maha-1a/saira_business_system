
import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List products = [];


  Future<void> loadProducts() async {

    final db = await DatabaseHelper.instance.database;

    final data = await db.query('products');

    setState(() {
      products = data;
    });

  }


  Future<void> deleteProduct(int id) async {

    final db = await DatabaseHelper.instance.database;

    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );

    loadProducts();
  }


  @override
  void initState() {
    super.initState();
    loadProducts();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Products"),
      ),


      body: products.isEmpty

          ? const Center(
              child: Text("No Product Found"),
            )

          : ListView.builder(

              itemCount: products.length,

              itemBuilder: (context, index) {

                final product = products[index];

                return Card(

                  child: ListTile(

                    title: Text(
                      product['name'],
                    ),

                    subtitle: Text(
                      "Category: ${product['category']}\n"
                      "Price: ${product['price']}  | Stock: ${product['stock']}",
                    ),


                    trailing: IconButton(

                      icon: const Icon(
                        Icons.delete,
                      ),

                      onPressed: () {

                        deleteProduct(
                          product['id'],
                        );

                      },
                    ),
                  ),
                );

              },
            ),
    );
  }
}
