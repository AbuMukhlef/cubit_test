import 'package:cubit_test/cubit/text_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  content: Text('Loading... ${cubit.controllerText.text}'),
                ),
              );
            }
            if (state is UpdateUIState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('Update Completed... ${cubit.controllerText.text}'),
                ),
              );
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const Text('Cubit Screen'),
                    const SizedBox(height: 20),
                    const Text(''),
                    const SizedBox(height: 250),
                    TextField(
                      controller: cubit.controllerText,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your name',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: cubit.doSomething,
                        child: const Text('Search')),
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
