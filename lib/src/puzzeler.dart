import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzeler/cubit/puzzeler_cubit.dart';
import 'package:puzzeler/src/puzzeler_item.dart';
import 'package:puzzeler/src/puzzeler_config.dart';
import 'dart:ui' as ui;

const _defaultBorderSide = BorderSide();

class Puzzeler extends StatelessWidget {
  const Puzzeler({
    super.key,
    this.config,
    required this.imageData,
  });

  final PuzzelerConfig? config;
  final List<int> imageData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PuzzelerCubit(
        config: config,
        imageData: imageData,
      ),
      child: const _Puzzeler(),
    );
  }
}

class _Puzzeler extends StatefulWidget {
  const _Puzzeler();

  @override
  State<_Puzzeler> createState() => _PuzzelerState();
}

class _PuzzelerState extends State<_Puzzeler> {
  @override
  Widget build(BuildContext context) {
    final _puzzelerCubit = BlocProvider.of<PuzzelerCubit>(context);

    return BlocBuilder<PuzzelerCubit, PuzzelerState>(
      bloc: _puzzelerCubit,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (items, pieces, aspectRatio) => ListView(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: aspectRatio,
                ),
                itemCount: items.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: _defaultBorderSide,
                      left: _defaultBorderSide,
                      right: _defaultBorderSide,
                      top: _defaultBorderSide,
                    ),
                  ),
                  child: items[index].correct
                      ? Center(
                          child: items[index].image,
                        )
                      : DragTarget<PuzzelerItem>(
                          builder: (
                            context,
                            candidateData,
                            rejectedData,
                          ) {
                            return const SizedBox();
                          },
                          onWillAccept: (data) {
                            if (data != null) {
                              return _puzzelerCubit.correctCharItemDropped(
                                data,
                                items[index],
                              );
                            }
                            return false;
                          },
                          onAccept: (data) {
                            _puzzelerCubit.onCharItemDropped(
                              data,
                              items[index],
                            );
                          },
                        ),
                ),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemCount: pieces.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Draggable<PuzzelerItem>(
                    dragAnchorStrategy: childDragAnchorStrategy,
                    data: pieces[index],
                    feedback: Material(
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                        ),
                        child: Center(
                          child: pieces[index].image,
                        ),
                      ),
                    ),
                    childWhenDragging: Container(),
                    child: !pieces[index].correct
                        ? Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                            ),
                            child: Center(
                              child: pieces[index].image,
                            ),
                          )
                        : Container(),
                  ),
                ),
              ),
            ],
          ),
          orElse: SizedBox.new,
        );
      },
    );
  }
}
