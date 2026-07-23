
import 'package:flutter/material.dart';
import '../reports_screen.dart';

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

        children: [

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
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReportsScreen(),
      ),
    );
  },
),

class DashboardCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  
  const DashboardCard({
  super.key,
  required this.icon,
  required this.title,
  this.onTap,
});



  @override
  Widget build(BuildContext context) {

   return InkWell(
  onTap: onTap,
  child: Card(
    elevation: 5,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);
