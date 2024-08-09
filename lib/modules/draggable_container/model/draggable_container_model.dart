import 'dart:ui';

class DraggableContainerModel {
  final int id;
  final String label;
  final Color color;
  final int index;

  DraggableContainerModel(this.id, this.label, this.color, this.index);

  DraggableContainerModel copyWith({
    int? id,
    String? label,
    Color? color,
    int? index,
  }) {
    return DraggableContainerModel(
      id ?? this.id,
      label ?? this.label,
      color ?? this.color,
      index ?? this.index,
    );
  }
}
