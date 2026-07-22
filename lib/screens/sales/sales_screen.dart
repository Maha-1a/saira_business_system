
import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {

  List products = [];

  String? selectedProduct;
  int quantity = 1;


  Future<void> loadProducts() async {

    final db = await DatabaseHelper.instance.database;

    final data = await db.query('products');

    setState(() {
      products = data;
    });

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
        title: const Text("Sales POS"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            DropdownButtonFormField(

              decoration: const InputDecoration(
                labelText: "Select Product",
              ),

              items: products.map((product){

                return DropdownMenuItem(
                  value: product['name'],
                  child: Text(product['name']),
                );

              }).toList(),


              onChanged: (value){

                setState(() {
                  selectedProduct = value.toString();
                });

              },

            ),


            const SizedBox(height:20),


            TextField(

              keyboardType: TextInputType.number,

              decoration: const InputDecoration(
                labelText: "Quantity",
              ),

              onChanged: (value){

                quantity = int.tryParse(value) ?? 1;

              },

            ),


            const SizedBox(height:30),


            ElevatedButton(

              onPressed: (){

                ScaffoldMessenger.of(context)
                .showSnackBar(

                  const SnackBar(
                    content: Text(
                      "Sale Completed",
                    ),
                  ),

                );

              },

              child: const Text(
                "SELL",
              ),

            )

          ],
        ),
      ),
    );
  }
}
