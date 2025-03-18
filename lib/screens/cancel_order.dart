import 'package:flutter/material.dart';

class CancelOrderPage extends StatefulWidget {
  const CancelOrderPage({super.key});

  @override
  State<CancelOrderPage> createState() => _CancelOrderPageState();
}

class _CancelOrderPageState extends State<CancelOrderPage> {
  String? selectedReason;
  TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Cancel Order", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Warning Box
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Cancelling orders affects your rating and may impact future orders.",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            // Order Information
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
                  Text("Order Information", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("City Pharmacy", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Order #12345 • \$18.50"),
                  Text("123 Main St, Apt 4B"),
                ],
              ),
            ),
            SizedBox(height: 15),

            // Cancellation Reasons
            Text("Select Reason", style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: [
                _buildRadioTile("Customer unavailable"),
                _buildRadioTile("Incorrect address"),
                _buildRadioTile("Store closed"),
                _buildRadioTile("Vehicle/bike issues"),
                _buildRadioTile("Other reason"),
              ],
            ),
            SizedBox(height: 15),

            // Additional Details
            Text("Additional Details"),
            SizedBox(height: 5),
            TextField(
              controller: detailsController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Please provide more information...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            // Confirm Cancellation Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle cancellation logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text("CONFIRM CANCELLATION", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile(String reason) {
    return RadioListTile(
      title: Text(reason),
      value: reason,
      groupValue: selectedReason,
      onChanged: (value) {
        setState(() {
          selectedReason = value.toString();
        });
      },
      activeColor: Colors.red,
    );
  }
}
