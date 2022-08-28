import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'puzzeler_item.freezed.dart';

@freezed
class PuzzelerItem with _$PuzzelerItem {
  const factory PuzzelerItem({
    required int id,
    required Image image,
    @Default(false) bool correct,
  }) = _PuzzelerItem;
}
