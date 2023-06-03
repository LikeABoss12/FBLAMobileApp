// sanath work
import 'package:flutter/material.dart';

void main() {
  runApp(EmailContactApp());
}

class EmailContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email/Contact App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> emails = [];
  List<String> contacts = [];

  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  void sendEmail() {
    setState(() {
      String email = emailController.text;
      emails.add(email);
      emailController.clear();
    });
  }

  void saveContact() {
    setState(() {
      String contact = contactController.text;
      contacts.add(contact);
      contactController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email/Contact App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter email',
              ),
            ),
            ElevatedButton(
              onPressed: sendEmail,
              child: Text('Send Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: contactController,
              decoration: InputDecoration(
                labelText: 'Enter contact',
              ),
            ),
            ElevatedButton(
              onPressed: saveContact,
              child: Text('Save Contact'),
            ),
            SizedBox(height: 16.0),
            Text('Emails:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: emails.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(emails[index]),
                );
              },
            ),
            SizedBox(height: 16.0),
            Text('Contacts:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(contacts[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
