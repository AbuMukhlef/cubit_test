import 'package:cubit_test/cubit/text_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'page_1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final Icon light = const Icon(Icons.brightness_2);
  final Icon dark = const Icon(Icons.brightness_2_outlined);
  final Icon arL = const Icon(Icons.language);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<TextCubit>();
        return BlocListener<TextCubit, TextState>(
          listener: (context, state) {
            if (state is LoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('loading ${cubit.controllerText.text}'),
                ),
              );
            }
            if (state is UpdateUIState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('update').tr(),
                ),
              );
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('cubit'),
                        IconButton(
                          icon: light,
                          onPressed: cubit.fetchData,
                        ),
                        IconButton(
                          icon: arL,
                          onPressed: cubit.changeLanguage(),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<TextCubit, TextState>(
                      builder: (context, state) {
                        return Text(cubit.controllerText.text);
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Page1();
                          }));
                        },
                        child: const Text('next_pag.tr()e')),
                    const SizedBox(height: 250),
                    TextField(
                      controller: cubit.controllerText,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:  'enter_your_name'.tr(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: cubit.fetchData,
                        child: const Text('fetch').tr()),
                    const SizedBox(height: 20),
                    BlocBuilder<TextCubit, TextState>(
                      builder: (context, state) {
                        return ListView(
                          shrinkWrap: true,
                          children: List.generate(
                              cubit.tableMap.length,
                              (index) =>
                                  Text('Subabase: ${cubit.tableMap[index]}')),
                        );
                      },
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
