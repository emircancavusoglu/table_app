import 'dart:math';
import 'dart:ui';
import 'package:equatable/equatable.dart';

class DraggableContainerModel extends Equatable{
  final int id;
  final double height;
  final String label;
  final Color color;

  const DraggableContainerModel(this.id,  this.label, this.color, {this.height = 100});

  @override
  List<Object?> get props => [id, label, color, height];
}