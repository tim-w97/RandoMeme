import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rando_meme/randomizer/cubit/randomizer_cubit.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final randomizerCubit = context.read<RandomizerCubit>();
          randomizerCubit.fetchRandomMeme();
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text("RandoMeme 🎲"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: BlocBuilder<RandomizerCubit, RandomizerState>(
              builder: (context, state) {
                if (state is RandomizerInitial) {
                  return const Text(
                    "Press the Button at the bottom right to fetch a new Meme. 🚀",
                    textAlign: TextAlign.center,
                  );
                }

                if (state is RandomizerMemeReceived) {
                  return Text(state.json);
                }

                if (state is RandomizerFetchFailed) {
                  return Text(state.reason);
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
