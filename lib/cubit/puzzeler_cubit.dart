// ignore_for_file: public_member_api_docs

// import 'dart:ui';

import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:puzzeler/src/puzzeler_item.dart';
import 'package:puzzeler/src/puzzeler_config.dart';
import 'package:puzzeler/src/puzzeler_item.dart';
import 'package:image/image.dart' as imglib;
import 'package:flutter/material.dart' as material;

part 'puzzeler_state.dart';
part 'puzzeler_cubit.freezed.dart';

class PuzzelerCubit extends Cubit<PuzzelerState> {
  PuzzelerCubit({
    PuzzelerConfig? config,
    required List<int> imageData,
  })  : _config = config,
        _imageData = imageData,
        super(const PuzzelerState.initial()) {
    _init();
  }

  final List<int> _imageData;
  final PuzzelerConfig? _config;
  List<PuzzelerItem> items = [];
  List<PuzzelerItem> pieces = [];
  double aspectRatio = 1.0;

  Future<void> _init() async {
    emit(const PuzzelerState.loading());
    await _loadItems();
    emit(
      PuzzelerState.loaded(
        items: items,
        pieces: pieces,
        aspectRatio: aspectRatio,
      ),
    );
  }

  Future<void> _loadItems({int horizontalPieceCount = 3, int verticalPieceCount = 3}) async {
    final image = imglib.decodeImage(_imageData)!;

    final xLength = (image.width / horizontalPieceCount).round();
    final yLength = (image.height / verticalPieceCount).round();
    aspectRatio = image.width / image.height;
    final pieceList = <imglib.Image>[];

    for (var y = 0; y < verticalPieceCount; y++) {
      for (var x = 0; x < horizontalPieceCount; x++) {
        pieceList.add(
          imglib.copyCrop(image, x * xLength, y * yLength, xLength, yLength),
        );
      }
    }

    for (var img in pieceList) {
      items.add(
        PuzzelerItem(
          id: pieceList.indexOf(img),
          image: Image.memory(
            Uint8List.fromList(imglib.encodeJpg(img)),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    pieces
      ..addAll(items)
      ..shuffle();
  }

  void onCharItemDropped(
    PuzzelerItem charItemDropped,
    PuzzelerItem charItem,
  ) {
    if (correctCharItemDropped(charItem, charItemDropped)) {
      emit(PuzzelerState.loading());
      items[items.indexOf(charItem)] = charItem.copyWith(
        correct: true,
      );
      pieces.remove(charItem);
      _checkIfCorrect();
      emit(
        PuzzelerState.loaded(
          items: items,
          pieces: pieces,
          aspectRatio: aspectRatio,
        ),
      );
    }
  }

  void _checkIfCorrect() {
    if (items.every((element) => element.correct)) {
      _config?.onGameCompleted?.call();
    }
  }

  bool correctCharItemDropped(
    PuzzelerItem charItem,
    PuzzelerItem charItemDropped,
  ) {
    if (charItemDropped.id == charItem.id) {
      return true;
    }
    return false;
  }
}
