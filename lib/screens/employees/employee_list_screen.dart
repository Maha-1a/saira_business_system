import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {

  List employees = [];


  Future<void> loadEmployees() async {

    final db = await DatabaseHelper.instance.database;

    final data = await db.query('employees');

    setState(() {
      employees = data;
    });

  }


  Future<void> deleteEmployee(int id) async {

    final db = await DatabaseHelper.instance.database;

    await db.delete(
      'employees',
      where: 'id = ?',
      whereArgs: [id],
    );

    loadEmployees();
  }


  @override
  void initState() {
    super.initState();
    loadEmployees();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Employees"),
      ),


      body: employees.isEmpty

          ? const Center(
              child: Text("No Employee Found"),
            )

          : ListView.builder(

              itemCount: employees.length,

              itemBuilder: (context, index) {

                final employee = employees[index];

                return Card(

                  child: ListTile(

                    title: Text(
                      employee['name'],
                    ),

                    subtitle: Text(
                      "Phone: ${employee['phone']}\n"
                      "Salary: ${employee['salary']}",
                    ),


                    trailing: IconButton(

                      icon: const Icon(
                        Icons.delete,
                      ),

                      onPressed: () {

                        deleteEmployee(
                          employee['id'],
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
