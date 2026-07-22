
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Saira Business System",
        ),
      ),

      body: GridView.count(

        padding: const EdgeInsets.all(20),

        crossAxisCount: 2,

        crossAxisSpacing: 15,
        mainAxisSpacing: 15,

        children: const [

          DashboardCard(
            icon: Icons.shopping_cart,
            title: "Sales",
          ),

          DashboardCard(
            icon: Icons.inventory,
            title: "Products",
          ),

          DashboardCard(
            icon: Icons.people,
            title: "Employees",
          ),

          DashboardCard(
            icon: Icons.person,
            title: "Customers",
          ),

          DashboardCard(
            icon: Icons.store,
            title: "Inventory",
          ),

          DashboardCard(
            icon: Icons.account_balance_wallet,
            title: "Accounts",
          ),

          DashboardCard(
            icon: Icons.bar_chart,
            title: "Reports",
          ),

          DashboardCard(
            icon: Icons.settings,
            title: "Settings",
          ),

        ],
      ),
    );
  }
}


class DashboardCard extends StatelessWidget {

  final IconData icon;
  final String title;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
  });


  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 5,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            size: 40,
          ),

          const SizedBox(height:10),

          Text(
            title,
            style: const TextStyle(
              fontSize:18,
              fontWeight: FontWeight.bold,
            ),
          )

        ],
      ),
    );
  }
}
