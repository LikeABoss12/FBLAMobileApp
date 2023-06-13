import 'package:flutter/material.dart';

import '../pallate.dart';
import '../widgets.dart/background_image.dart';

// ignore: camel_case_types
class teachOrStu extends StatelessWidget {
  const teachOrStu({super.key});

  @override
  Widget build(BuildContext context) 
  {
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
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 70,
                    // ignore: prefer_const_constructors
                    child: Center(
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Bears Aware',
                        style: kHeading,
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 250,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      // ignore: prefer_const_constructors
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context,'Student'),
                                // ignore: prefer_const_constructors
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(0),
                                      ),
                                    // ignore: prefer_const_constructors
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:50.0),
                                      // ignore: prefer_const_constructors
                                      child: Text(
                                      'Student',
                                      style: kBodyText,
                                      ),
                                    ),
                                                                  ),
                                  ),
                              ),
                             Padding(
                               padding: const EdgeInsets.symmetric(vertical:20.0),
                               child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(context,'Teacher'),
                                  // ignore: prefer_const_constructors
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(0),
                                        ),
                                      // ignore: prefer_const_constructors
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:50.0),
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                        'Teacher',
                                        style: kBodyText,
                                        ),
                                      ),
                                                                    ),
                                    ),
                                ),
                             ),
                              Padding(
                               padding: const EdgeInsets.symmetric(vertical:5.0),
                               child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(context,'Parent'),
                                  // ignore: prefer_const_constructors
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(0),
                                        ),
                                      // ignore: prefer_const_constructors
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:55.0),
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                        'Parent',
                                        style: kBodyText,
                                        ),
                                      ),
                                                                    ),
                                    ),
                                ),
                             ),
                            ],
                          ),
                        ],
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
    );
  }
}