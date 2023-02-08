import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'randomizer_state.dart';

class RandomizerCubit extends Cubit<RandomizerState> {
  RandomizerCubit() : super(RandomizerInitial());
}
