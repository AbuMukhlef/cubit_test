import 'package:cubit_test/core/theme/extensions/theme_ext.dart';
import 'package:cubit_test/screen/start/widget/box_dec.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            decoration: boxDec(),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                CircleAvatar(
                  radius: 8.w,
                  child: const Icon(Icons.person),
                )
              ],
            ),
          ),
        ),
        drawer: const Drawer(),
        body: Container(
          decoration: boxDec(),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
