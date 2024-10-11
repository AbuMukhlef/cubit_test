import 'package:cubit_test/screen/menu/menu_screen.dart';
import 'package:cubit_test/screen/start/cubit/nav_cubit.dart';
import 'package:cubit_test/screen/start/widget/box_dec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<NavCubit>();
        return Scaffold(
          body: Container(
            decoration: boxDec(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cup.png'),
                  SizedBox(height: 25.w),
                  Text(
                      textAlign: TextAlign.center,
                      'Bringing comfort with a cup of coffee',
                      style: TextStyle(fontSize: 4.w)),
                  SizedBox(height: 25.w),
                  ElevatedButton(
                      onPressed: () {
                        cubit.goCubitTo(
                            context: context, screenView: const MenuScreen());
                      },
                      child: const Text('Get started')),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
