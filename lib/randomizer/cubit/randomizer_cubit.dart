import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rando_meme/randomizer/meme_repository.dart';

part 'randomizer_state.dart';

class RandomizerCubit extends Cubit<RandomizerState> {
  MemeRepository memeRepository;

  RandomizerCubit({required this.memeRepository}) : super(RandomizerInitial());
}
