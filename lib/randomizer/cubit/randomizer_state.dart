part of 'randomizer_cubit.dart';

@immutable
abstract class RandomizerState {}

class RandomizerInitial extends RandomizerState {}

class RandomizerLoading extends RandomizerState {}

class RandomizerFetchFailed extends RandomizerState {
  final String reason;

  RandomizerFetchFailed(this.reason);
}

class RandomizerMemeReceived extends RandomizerState {
  final String json;

  RandomizerMemeReceived(this.json);
}
