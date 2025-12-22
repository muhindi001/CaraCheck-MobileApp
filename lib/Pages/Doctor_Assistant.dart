import 'package:flutter/material.dart';

class DoctorAssistant extends StatelessWidget {
  const DoctorAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Assistant'),
      ),
      body: Center(
        child: Text('Welcome to the Doctor Assistant Page!'),
      ),
    );
  }
}