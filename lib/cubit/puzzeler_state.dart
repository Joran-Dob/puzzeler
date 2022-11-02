part of 'puzzeler_cubit.dart';

@freezed
class PuzzelerState with _$PuzzelerState {
  const factory PuzzelerState.initial() = _Initial;
  const factory PuzzelerState.loading() = _Loading;
  const factory PuzzelerState.loaded({
    required List<PuzzelerItem> items,
    required List<PuzzelerItem> pieces,
    required double aspectRatio,
    required Image image,
  }) = _Loaded;
  const factory PuzzelerState.error({
    required String message,
  }) = _Error;
}
