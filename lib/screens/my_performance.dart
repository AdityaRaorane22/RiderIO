import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyPerformancePage extends StatelessWidget {
  const MyPerformancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Performance", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating Section
            Container(
              padding: EdgeInsets.all(15),
              decoration: _boxDecoration(),
              child: Column(
                children: [
                  Text("Your Rating", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_half,
                        color: Colors.amber,
                        size: 30,
                      );
                    }),
                  ),
                  SizedBox(height: 5),
                  Text("Based on 124 deliveries", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 15),

            // Weekly Performance Title
            Text("Weekly Performance", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            // Bar Chart
            Container(
              height: 150,
              padding: EdgeInsets.all(10),
              decoration: _boxDecoration(),
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
                          return Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(days[value.toInt()], style: TextStyle(fontSize: 12)),
                          );
                        },
                        reservedSize: 20,
                      ),
                    ),
                  ),
                  barGroups: [
                    _barData(0, 4),
                    _barData(1, 5),
                    _barData(2, 7),
                    _barData(3, 6),
                    _barData(4, 5),
                    _barData(5, 4),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),

            // Performance Metrics
            Row(
              children: [
                Expanded(child: _metricCard("On-time Delivery", "96%", Colors.blue)),
                SizedBox(width: 10),
                Expanded(child: _metricCard("Cancellation Rate", "1.2%", Colors.green)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _metricCard("Accept Rate", "92%", Colors.blue)),
                SizedBox(width: 10),
                Expanded(child: _metricCard("Feedback Score", "4.8", Colors.yellow)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method for Bar Data
  BarChartGroupData _barData(int x, double y) {
    return BarChartGroupData(x: x, barRods: [BarChartRodData(toY: y, color: Colors.blue, width: 18)]);
  }

  // Performance Metric Card
  Widget _metricCard(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  value: double.parse(value.replaceAll('%', '')) / 100,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation(color),
                ),
              ),
              Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  // Box Decoration
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1)],
    );
  }
}
