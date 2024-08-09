import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table/config/colors.dart';
import 'package:table/modules/draggable_container/bloc/draggable_container_bloc.dart';
import 'package:table/modules/draggable_container/bloc/draggable_container_state.dart';
import 'package:table/modules/draggable_container/model/draggable_container_model.dart';
import '../bloc/draggable_container_event.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DraggableContainerBloc(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: const HomePageView(),
        ),
      ),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Widget _buildDraggableItem(int index, DraggableContainerState state) {
    final draggableContainer = state.draggableItems[index];
    return Expanded(
      child: Builder(
        builder: (context) {
          return Draggable<DraggableContainerModel>(
            data: draggableContainer,
            feedback: Material(
              child: Container(
                width: MediaQuery.of(context).size.width / state.draggableItems.length,
                height: 100,
                color: _getColor(draggableContainer.id),
                child: Center(
                  child: Text(
                    "Kutu ID: ${draggableContainer.index}",
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            childWhenDragging: Container(
              height: 100,
              width: MediaQuery.of(context).size.width / state.draggableItems.length,
              color: Colors.grey,
            ),
            child: DragTarget<DraggableContainerModel>(
              onAcceptWithDetails: (details) {
                final fromIndex = details.data.index;
                final toIndex = draggableContainer.index;

                context.read<DraggableContainerBloc>().add(DraggableContainerSwap(fromIndex, toIndex));
              },
              builder: (context, candidateData, rejectedData) {
                return GestureDetector(
                  onTap: () {
                    context.read<DraggableContainerBloc>().add(DraggableContainerDelete(draggableContainer.id));
                  },
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width / state.draggableItems.length,
                    color: _getColor(draggableContainer.id),
                    child: Center(
                      child: Text(
                        "Kutu ID: ${draggableContainer.index}",
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DraggableContainerBloc, DraggableContainerState>(
          builder: (context, state) {
            if (state.draggableItems.isEmpty) {
              return const Center(child: Text("No items"));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                state.draggableItems.length,
                    (index) => _buildDraggableItem(index, state),
              ),
            );
          },
        ),
        const SizedBox(height: 100),
        ElevatedButton(
          onPressed: () {
            context.read<DraggableContainerBloc>().add(DraggableContainerAdd());
          },
          child: const Text("Ekle"),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}

Color _getColor(int id) {
  switch (id % 5) {
    case 0:
      return ColumnColors.blue;
    case 1:
      return ColumnColors.red;
    case 2:
      return ColumnColors.purple;
    case 3:
      return ColumnColors.yellow;
    case 4:
      return ColumnColors.green;
    default:
      return Colors.grey;
  }
}
