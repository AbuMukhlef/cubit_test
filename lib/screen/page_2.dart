import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('second').tr()),
    );
  }
}
