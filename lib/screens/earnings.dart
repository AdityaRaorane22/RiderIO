import 'package:flutter/material.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Earnings Summary"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Earnings Overview
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Earnings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("\$1,250.75", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Completed Orders", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("45", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Average Earnings", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("\$27.80/order", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            // Recent Earnings
            Text("Recent Transactions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionItem("Order #12345", "March 16, 2025", "\$18.50"),
                  _buildTransactionItem("Order #12344", "March 15, 2025", "\$22.75"),
                  _buildTransactionItem("Order #12343", "March 14, 2025", "\$30.00"),
                  _buildTransactionItem("Order #12342", "March 13, 2025", "\$15.25"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for transaction list items
  Widget _buildTransactionItem(String orderId, String date, String amount) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderId, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(date, style: TextStyle(color: Colors.black54)),
            ],
          ),
          Text(amount, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
        ],
      ),
    );
  }
}
