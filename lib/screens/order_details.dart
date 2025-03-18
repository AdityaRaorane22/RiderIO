import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Order Details", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Status
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order Status", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("#12345", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text("Ready for Pickup", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.qr_code, size: 100, color: Colors.black54),
                        Text("Scan to Confirm Pickup", style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            // Pickup & Delivery Locations
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
                  Text("Pickup Location", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("City Pharmacy", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                  Text("789 Health Blvd"),
                  SizedBox(height: 10),
                  Text("Delivery Location", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("123 Main St, Apt 4B", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                  Text("Downtown, City Center"),
                ],
              ),
            ),
            SizedBox(height: 15),

            // Progress Indicator
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
              ),
              child: Center(
                child: Column(
                  children: [
                    Slider(
                      value: 0.5, // Progress indicator value (adjust as needed)
                      onChanged: (value) {},
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey[300],
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        // Navigation logic
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      child: Text("NAVIGATE", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),

            // Order Items
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
                  Text("Order Items", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Prescription Medication"),
                      Text("x1"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Health Supplements"),
                      Text("x2"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("MEDICAL PRIORITY", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
