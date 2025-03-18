import 'package:flutter/material.dart';
import 'package:riderio/screens/earnings.dart';
import 'package:riderio/screens/my_performance.dart';
import 'package:riderio/screens/orders.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle, color: Colors.green, size: 14), // Online indicator
            SizedBox(width: 5),
            Text("ONLINE", style: TextStyle(color: Colors.white)),
            Spacer(),
            Text("12:30", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's Summary
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today's Summary", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Orders Completed: "),
                      Text("8", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Time Online: "),
                      Text("6h 30m", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Earnings: "),
                      Text("\$124.50", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Rating: "),
                      Row(
                        children: [
                          Text("4.8", style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(Icons.star, color: Colors.amber, size: 16),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            // New Order
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Order!", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order #12345"),
                      Text("\$18.50", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text("Pickup: City Pharmacy", style: TextStyle(color: Colors.black87)),
                  Text("Deliver to: 123 Main St, Apt 4B", style: TextStyle(color: Colors.black87)),
                  Text("Distance: 2.4 miles", style: TextStyle(color: Colors.black87)),
                  Text("Time: ~15 minutes", style: TextStyle(color: Colors.black87)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Accept Order Logic
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: Text("ACCEPT", style: TextStyle(color: Colors.white)),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          // Decline Order Logic
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red),
                        ),
                        child: Text("DECLINE", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            // Pending Deliveries
            Text("Pending Deliveries", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sunset Cafe", style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order #12344"),
                      Text("In Progress", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  Text("456 Park Ave"),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // View details logic
                      },
                      child: Text("View Details", style: TextStyle(color: Colors.green)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Home selected
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          if (index == 1) { // ✅ Orders Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrdersPage()),
            );
          } else if (index == 2) { // ✅ Earnings Page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EarningsPage()),
            );
          } else if (index == 3) { // ✅ Account (My Performance Page)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPerformancePage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: "Earnings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
