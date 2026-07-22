
import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();


  Future<void> saveProduct() async {

    final db = await DatabaseHelper.instance.database;

    await db.insert(
      'products',
      {
        'name': nameController.text,
        'category': categoryController.text,
        'price': double.tryParse(priceController.text) ?? 0,
        'stock': int.tryParse(stockController.text) ?? 0,
      },
    );


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Product Saved"),
      ),
    );


    nameController.clear();
    categoryController.clear();
    priceController.clear();
    stockController.clear();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Product"),
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Product Name",
              ),
            ),


            TextField(
              controller: categoryController,
              decoration: const InputDecoration(
                labelText: "Category",
              ),
            ),


            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Selling Price",
              ),
            ),


            TextField(
              controller: stockController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Stock Quantity",
              ),
            ),


            const SizedBox(height:30),


            ElevatedButton(
              onPressed: saveProduct,
              child: const Text("SAVE"),
            )

          ],
        ),
      ),
    );
  }
}
