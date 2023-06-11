import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(AppNavigator());
}

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/appointment': (context) => AppointmentPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 8.0, left: 16.0),
          child: Text(
            'Home Page',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 4,
        toolbarHeight: 80,
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
                icon: Icons.business,
                label: 'Business',
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
                icon: Icons.calendar_month_outlined,
                label: 'Calendar',
              ),
              CircularButton(
                color: Colors.orange,
                icon: Icons.settings,
                label: 'Settings',
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/appointment');
                },
                child: CircularButton(
                  color: Colors.purple,
                  icon: Icons.photo_album_outlined,
                  label: 'Photos',
                ),
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
              PopupMenuButton<String>(
                icon: Icon(Icons.phone),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'call',
                      child: ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('Call School'),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'email',
                      child: ListTile(
                        leading: Icon(Icons.email),
                        title: Text('Email School'),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'appointment',
                      child: ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: Text('Book Appointment'),
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 'call') {
                    launchUrlString('tel:+123456789'); // Replace with the actual phone number
                  } else if (value == 'email') {
                    launchUrlString('mailto:school@example.com'); // Replace with the actual email address
                  } else if (value == 'appointment') {
                    Navigator.pushNamed(context, '/appointment');
                  }
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
    return Column(
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
    );
  }
}

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose Appointment Date and Reason',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle appointment submission
              },
              child: Text('Select Date'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Reason for Appointment',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle appointment submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
