import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/modules/draggable_container/model/draggable_container_model.dart';
import 'package:table/utils/helper/randomNumber.dart';

import '../../../utils/helper/random_color.dart';
import 'draggable_container_event.dart';
import 'draggable_container_state.dart';


class DraggableContainerBloc extends Bloc<DraggableContainerEvent, DraggableContainerState>{
  DraggableContainerBloc(): super(const DraggableContainerState()){
    on<DraggableContainerAdd>((event, emit) {
      print("DraggableContainerAdd");
      List<DraggableContainerModel> updatedItems = List.from(state.draggableItems)
      ..add(DraggableContainerModel(generateRandomNumber(), "label", getRandomColor()));
      emit(state.copyWith(draggableItems: updatedItems));
    });
    on<DraggableContainerDelete>((event, emit){
      print("delete");
      List<DraggableContainerModel> updatedItems = List.from(state.draggableItems)
      ..removeWhere((item) => item.id == event.id);

      emit(state.copyWith(draggableItems: updatedItems));

    });
  }
}
