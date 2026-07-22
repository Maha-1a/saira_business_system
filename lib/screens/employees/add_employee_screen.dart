
import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final positionController = TextEditingController();
  final salaryController = TextEditingController();


  Future<void> saveEmployee() async {

    final db = await DatabaseHelper.instance.database;

    await db.insert(
      'employees',
      {
        'name': nameController.text,
        'phone': phoneController.text,
        'salary': double.tryParse(salaryController.text) ?? 0,
      },
    );


    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Employee Saved"),
      ),
    );


    nameController.clear();
    phoneController.clear();
    positionController.clear();
    salaryController.clear();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Add Employee"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Employee Name",
              ),
            ),


            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
              ),
            ),


            TextField(
              controller: positionController,
              decoration: const InputDecoration(
                labelText: "Position",
              ),
            ),


            TextField(
              controller: salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Salary",
              ),
            ),


            const SizedBox(height:30),


            ElevatedButton(
              onPressed: saveEmployee,
              child: const Text("SAVE"),
            )

          ],
        ),
      ),
    );
  }
}
