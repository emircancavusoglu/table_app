import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/modules/draggable_container/model/draggable_container_model.dart';
import 'package:table/utils/helper/randomNumber.dart';
import '../../../utils/helper/random_color.dart';
import 'draggable_container_event.dart';
import 'draggable_container_state.dart';

class DraggableContainerBloc extends Bloc<DraggableContainerEvent, DraggableContainerState> {
  DraggableContainerBloc() : super(const DraggableContainerState()) {
    on<DraggableContainerAdd>((event, emit) {
      final index = state.draggableItems.length;
      List<DraggableContainerModel> updatedItems = List.from(state.draggableItems)
        ..add(DraggableContainerModel(generateRandomNumber(), "label", getRandomColor(), index));
      emit(state.copyWith(draggableItems: updatedItems));
    });

    on<DraggableContainerDelete>((event, emit) {
      List<DraggableContainerModel> updatedItems = List.from(state.draggableItems)
        ..removeWhere((item) => item.id == event.id);
      // Update indices after deletion
      updatedItems = updatedItems.asMap().map((i, item) => MapEntry(i, item.copyWith(index: i))).values.toList();
      emit(state.copyWith(draggableItems: updatedItems));
    });

    on<DraggableContainerSwap>((event, emit) {
      List<DraggableContainerModel> updatedItems = List.from(state.draggableItems);
      if (event.fromIndex >= 0 && event.fromIndex < updatedItems.length &&
          event.toIndex >= 0 && event.toIndex < updatedItems.length) {
        final temp = updatedItems[event.fromIndex];
        updatedItems[event.fromIndex] = updatedItems[event.toIndex];
        updatedItems[event.toIndex] = temp;
        updatedItems[event.fromIndex] = updatedItems[event.fromIndex].copyWith(index: event.fromIndex);
        updatedItems[event.toIndex] = updatedItems[event.toIndex].copyWith(index: event.toIndex);
      }
      emit(state.copyWith(draggableItems: updatedItems));
    });
  }
}
