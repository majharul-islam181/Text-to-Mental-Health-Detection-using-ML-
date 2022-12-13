import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../carousel.dart';

class iHomepage extends StatefulWidget {
  const iHomepage({super.key});

  @override
  State<iHomepage> createState() => _iHomepageState();
}

class _iHomepageState extends State<iHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Carousel(),
            )
          ],
        ),
      ),
    );
  }
}