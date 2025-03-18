import 'package:flutter/material.dart';
import 'login.dart';

class ScreenQueue extends StatefulWidget {
  @override
  _ScreenQueueState createState() => _ScreenQueueState();
}

class _ScreenQueueState extends State<ScreenQueue> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  List<String> images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(images[index], fit: BoxFit.cover);
            },
          ),
          if (currentPage == images.length - 1)
            Positioned(
              bottom: 50,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("Get Started"),
              ),
            ),
        ],
      ),
    );
  }
}
