import 'package:equatable/equatable.dart';
import '../../../utils/helper/randomNumber.dart';
import '../model/draggable_container_model.dart';

class DraggableContainerState extends Equatable{
 final List<DraggableContainerModel> draggableItems;

  const DraggableContainerState({

    this.draggableItems =  const [],
  });

 DraggableContainerState copyWith({List<DraggableContainerModel>? draggableItems}){
  return DraggableContainerState(draggableItems: draggableItems ?? this.draggableItems);
 }

  @override
  List<Object?> get props => [draggableItems];
}