import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rando_meme/randomizer/cubit/randomizer_cubit.dart';
import 'package:rando_meme/randomizer/meme_repository.dart';
import 'package:rando_meme/randomizer/randomizer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RandoMeme',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: ((context) =>
            RandomizerCubit(memeRepository: MemeRepository())),
        child: const RandomizerPage(),
      ),
    );
  }
}
