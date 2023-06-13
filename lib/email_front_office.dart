// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(ContactPageApp());
}

class ContactPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Administration',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  void _sendEmail(BuildContext context) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'admin@example.com',
      query: 'subject=Hello%20from%20Contact%20Page',
    );

    final String url = params.toString();

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch email'),
        ),
      );
    }
  }

  void _makeCall() async {
    final Uri params = Uri(
      scheme: 'tel',
      path: '8323346423',
    );

    final String url = params.toString();

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      print('Could not launch phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Administration'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Perform home button action
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              onTap: () => _makeCall(),
              leading: Icon(Icons.phone),
              title: Text(
                'Call',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () => _sendEmail(context),
              leading: Icon(Icons.email),
              title: Text(
                'Email',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                // Perform appointment action
              },
              leading: Icon(Icons.calendar_today),
              title: Text(
                'Make an Appointment',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
