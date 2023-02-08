import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rando_meme/randomizer/meme_repository.dart';
import 'package:rando_meme/randomizer/model/meme.dart';

part 'randomizer_state.dart';

class RandomizerCubit extends Cubit<RandomizerState> {
  MemeRepository memeRepository;

  RandomizerCubit({required this.memeRepository}) : super(RandomizerInitial());

  void fetchRandomMeme() async {
    emit(RandomizerLoading());

    try {
      Meme meme = await memeRepository.fetchRandomMeme();
      emit(RandomizerMemeReceived(meme));
    } catch (ex) {
      emit(RandomizerFetchFailed(ex.toString()));
    }
  }
}
