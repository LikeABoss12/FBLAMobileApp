import 'package:flutter/material.dart';
import '../pallate.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.orangeAccent,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            // ignore: prefer_const_constructors
            title: Text(
              'Forgot Password?',
              style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height*0.3,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                    height:400,
                    width: size.width*0.7,
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Please contact your school administration for assistance.',
                      style:headings,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}