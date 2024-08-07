import 'package:equatable/equatable.dart';

 sealed class DraggableContainerEvent{

}
class DraggableContainerAdd extends DraggableContainerEvent{
//eventi takip etmek için
 DraggableContainerAdd();

}
class DraggableContainerDelete extends DraggableContainerEvent{
  final int id;
  DraggableContainerDelete(this.id);
}