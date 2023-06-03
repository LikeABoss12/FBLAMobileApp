import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'Home Page',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: false,
          elevation: 4, // Adjust elevation as needed
          toolbarHeight: 80, // Adjust toolbar height as needed
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Page',
              style: TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(
                  color: Colors.red,
                  icon: Icons.home,
                  label: 'Home',
                ),
                CircularButton(
                  color: Colors.green,
                  icon: Icons.calendar_month_outlined,
                  label: 'Calendar',
                ),
                CircularButton(
                  color: Colors.blue,
                  icon: Icons.school,
                  label: 'School',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularButton(
                  color: Colors.yellow,
                  icon: Icons.share,
                  label: 'Share Photo',
                ),
                CircularButton(
                  color: Colors.orange,
                  icon: Icons.settings,
                  label: 'Settings',
                ),
                CircularButton(
                  color: Colors.purple,
                  icon: Icons.photo_album_outlined,
                  label: 'Album',
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    // Handle home icon press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    // Handle phone icon press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.grade),
                  onPressed: () {
                    // Handle grades icon press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    // Handle profile icon press
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const CircularButton({
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle circular button press
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
