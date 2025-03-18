import 'package:flutter/material.dart';
import 'cancel_order.dart'; // ✅ Import cancel_order.dart

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  Map<int, Color> orderColors = {}; // Stores color changes per order

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> orders = [
      {
        "id": 1,
        "category": "Medical",
        "pickup": "City Pharmacy",
        "customer": {"name": "John Doe", "phone": "9876543210", "address": "123 Main St, Apt 4B"},
        "distance": "2.4 miles",
        "items": [
          {"name": "Paracetamol", "price": 5.50},
          {"name": "Vitamin C", "price": 8.00},
          {"name": "Cough Syrup", "price": 5.00}
        ]
      },
      {
        "id": 2,
        "category": "Stationery",
        "pickup": "Office Supplies",
        "customer": {"name": "Sarah Lee", "phone": "8765432109", "address": "45 Elm St, Apt 7A"},
        "distance": "3.1 miles",
        "items": [
          {"name": "Notebook", "price": 3.75},
          {"name": "Pen Pack", "price": 2.50},
          {"name": "Markers", "price": 6.50}
        ]
      },
      {
        "id": 3,
        "category": "Dairy",
        "pickup": "Dairy Fresh",
        "customer": {"name": "Mike Johnson", "phone": "7654321098", "address": "88 Oak St, Apt 3C"},
        "distance": "1.8 miles",
        "items": [
          {"name": "Milk (1L)", "price": 2.00},
          {"name": "Cheese Block", "price": 4.50},
          {"name": "Butter", "price": 3.25}
        ]
      },
      {
        "id": 4,
        "category": "Grocery",
        "pickup": "SuperMart",
        "customer": {"name": "Emma Watson", "phone": "6543210987", "address": "67 Pine St, Apt 2D"},
        "distance": "5.2 miles",
        "items": [
          {"name": "Rice (5kg)", "price": 10.00},
          {"name": "Vegetables", "price": 7.50},
          {"name": "Cooking Oil", "price": 8.60}
        ]
      }
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Available Orders"), backgroundColor: Colors.blue),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            var order = orders[index];
            var totalPrice = order["items"].fold(0.0, (sum, item) => sum + item["price"]);

            return Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: orderColors[order["id"]] ?? Colors.lightBlue[50], // Default color
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Order!", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Order #${order["id"]}", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text("Pickup: ${order["pickup"]}", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Deliver to: ${order["customer"]["name"]}"),
                  Text("Phone: ${order["customer"]["phone"]}"),
                  Text("Address: ${order["customer"]["address"]}"),
                  Text("Distance: ${order["distance"]}"),
                  SizedBox(height: 8),
                  Text("Items:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ...order["items"].map<Widget>((item) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                      child: Text("• ${item["name"]} - \$${item["price"].toStringAsFixed(2)}"),
                    );
                  }).toList(),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                orderColors[order["id"]] = Colors.lightGreen[200]!; // ✅ Turn green when accepted
                              });
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            child: Text("ACCEPT"),
                          ),
                          SizedBox(width: 10),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                orderColors[order["id"]] = Colors.red[100]!; // ✅ Turn red when declined
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CancelOrderPage()),
                              );
                            },
                            style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.red)),
                            child: Text("DECLINE", style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
