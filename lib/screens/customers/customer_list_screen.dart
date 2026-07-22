
import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {

  List customers = [];


  Future<void> loadCustomers() async {

    final db = await DatabaseHelper.instance.database;

    final data = await db.query('customers');

    setState(() {
      customers = data;
    });

  }


  Future<void> deleteCustomer(int id) async {

    final db = await DatabaseHelper.instance.database;

    await db.delete(
      'customers',
      where: 'id = ?',
      whereArgs: [id],
    );

    loadCustomers();
  }


  @override
  void initState() {
    super.initState();
    loadCustomers();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Customers"),
      ),


      body: customers.isEmpty

          ? const Center(
              child: Text("No Customer Found"),
            )

          : ListView.builder(

              itemCount: customers.length,

              itemBuilder: (context,index){

                final customer = customers[index];


                return Card(

                  child: ListTile(

                    title: Text(
                      customer['name'],
                    ),

                    subtitle: Text(
                      "Phone: ${customer['phone']}\n"
                      "Due: ${customer['due']}",
                    ),


                    trailing: IconButton(

                      icon: const Icon(
                        Icons.delete,
                      ),

                      onPressed: (){

                        deleteCustomer(
                          customer['id'],
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
