import 'package:cubit_test/core/theme/extensions/theme_ext.dart';
import 'package:cubit_test/screen/menu/cubit/menu_cubit.dart';
import 'package:cubit_test/screen/start/widget/box_dec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<MenuCubit>();
        return BlocListener<MenuCubit, MenuState>(
          listener: (context, state) {
            if (state is UpdateUIState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('Sorry, no item found for ${cubit.searchController.text}'),
                ),
              );
            }
          },
          child: Scaffold(
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
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlocProvider(
                        create: (context) => MenuCubit(),
                        child: TextField(
                          controller: cubit.searchController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(),
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    BlocProvider(
                      create: (context) => MenuCubit(),
                      child: ElevatedButton(
                          onPressed: () {
                            cubit.searchText(
                                controller: cubit.searchController);
                          },
                          child: Text(
                            'Search',
                            style: TextStyle(color: context.primary),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
