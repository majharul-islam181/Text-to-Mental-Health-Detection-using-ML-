import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoctorDetatls extends StatefulWidget {
  const DoctorDetatls({super.key});

  @override
  State<DoctorDetatls> createState() => _DoctorDetatlsState();
}

class _DoctorDetatlsState extends State<DoctorDetatls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Doctor Information'),


        
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            
          ),
        ) ,
      ),
    );
  }
}