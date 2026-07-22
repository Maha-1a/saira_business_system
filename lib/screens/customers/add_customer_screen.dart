
import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dueController = TextEditingController();


  Future<void> saveCustomer() async {

    final db = await DatabaseHelper.instance.database;

    await db.insert(
      'customers',
      {
        'name': nameController.text,
        'phone': phoneController.text,
        'due': double.tryParse(dueController.text) ?? 0,
      },
    );


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Customer Saved"),
      ),
    );


    nameController.clear();
    phoneController.clear();
    dueController.clear();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Customer"),
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Customer Name",
              ),
            ),


            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
              ),
            ),


            TextField(
              controller: dueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Due Amount",
              ),
            ),


            const SizedBox(height:30),


            ElevatedButton(
              onPressed: saveCustomer,
              child: const Text("SAVE"),
            )

          ],
        ),
      ),
    );
  }
}
