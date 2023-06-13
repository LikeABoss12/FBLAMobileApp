// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors,, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../pallate.dart';
import '../widgets.dart/widgets.dart';

class parentLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/bridgeland.jpg',
        ),
        Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: Center(
                      child: Text(
                        'Bears Aware',
                        style: kHeading,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 230,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              EnterFields(
                                hint: 'Email',
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                              ),
                              EnterPassword(
                                hint: 'Password',
                                inputType: TextInputType.visiblePassword,
                                inputAction: TextInputAction.done,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context,'ForgotPassword'),
                                child: Text(
                                  'Forgot Password?',
                                  style: kBodyText,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              LoginButton(
                                buttonText:'Login',
                                ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            )),
      ],
    );
  }
}