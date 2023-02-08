import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rando_meme/randomizer/cubit/randomizer_cubit.dart';
import 'package:rando_meme/randomizer/model/meme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          child: BlocBuilder<RandomizerCubit, RandomizerState>(
            builder: (context, state) {
              if (state is RandomizerInitial) {
                return const Center(
                  child: Text(
                    "Press the Button at the bottom right to fetch a new Meme. 🚀",
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (state is RandomizerMemeReceived) {
                final Meme meme = state.meme;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(flex: 2, child: Image.network(meme.url)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            launchUrlString(meme.postLink);
                          },
                          icon: const Icon(Icons.public),
                        ),
                        Text("Author: ${meme.author}"),
                      ],
                    ),
                    const Spacer(),
                  ],
                );
              }

              if (state is RandomizerFetchFailed) {
                return Text(state.reason);
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
