import 'package:equatable/equatable.dart';

 sealed class DraggableContainerEvent{

}
class DraggableContainerAdd extends DraggableContainerEvent{
 DraggableContainerAdd();

}
class DraggableContainerDelete extends DraggableContainerEvent{
  final int id;
  DraggableContainerDelete(this.id);
}
class DraggableContainerSwap extends DraggableContainerEvent{
  final int fromIndex;
  final int toIndex;
  DraggableContainerSwap(this.fromIndex, this.toIndex);
}