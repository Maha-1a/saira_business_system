
import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Accounts"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.add_circle,
                ),
                title: const Text(
                  "Income",
                ),
                subtitle: const Text(
                  "Add business income",
                ),
              ),
            ),


            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.remove_circle,
                ),
                title: const Text(
                  "Expense",
                ),
                subtitle: const Text(
                  "Add business expense",
                ),
              ),
            ),


            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet,
                ),
                title: const Text(
                  "Cash Book",
                ),
                subtitle: const Text(
                  "View cash history",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
