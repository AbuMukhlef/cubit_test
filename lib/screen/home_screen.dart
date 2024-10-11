import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Image.asset('assets/images/cup.png'),
              SizedBox(height: 25.w),
              Text('Bringing comfort with a cup of coffee',
                  style: TextStyle(fontSize: 5.w)),
              SizedBox(height: 25.w),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Get started')),
            ],
          ),
        ),
      ),
    );
  }
}
