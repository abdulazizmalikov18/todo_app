import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubit/cubit.dart';
import 'package:todoapp/cubit/states.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/widgets/todo_tile.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoStates>(builder: (context, state) {
      var cubit = TodoCubit.get(context);
      List<TodoModel>? todosList = [];
      for (var item in cubit.todosList!) {
        if (!item.isArchived && !item.isDone) {
          todosList.add(item);
        }
      }
      return todosList.isEmpty
          ? const Center(
              child: Text('All Todos is empty'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TodoTile(todoModel: todosList[index]);
              },
              itemCount: todosList.length,
              shrinkWrap: true,
            );
    });
  }
}
