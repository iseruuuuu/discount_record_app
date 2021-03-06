import 'dart:async';

import 'package:discount_things_app/model/model.dart';

import 'bloc.dart';

class TodoBloc {
  final _todoController = StreamController<List<Todo>>();

  Stream<List<Todo>> get todoStream => _todoController.stream;

  getTodos() async {
    _todoController.sink.add(await DBProvider.db.getAllTodos());
  }

  TodoBloc() {
    getTodos();
  }

  dispose() {
    //多くのアプリケーションは1つのデータベースを使用し、データベースを閉じる必要はありません（アプリケーションが終了するとデータベースは閉じられます）。リソースを解放したい場合は、データベースを閉じることができます。
    _todoController.close();
  }

  create(Todo todo) {
    todo.assignUUID();
    DBProvider.db.createTodo(todo);
    getTodos();
  }

  update(Todo todo) {
    DBProvider.db.updateTodo(todo);
    getTodos();
  }

  delete(String id) {
    DBProvider.db.deleteTodo(id);
    getTodos();
  }

  allDelete() {
    DBProvider.db.deleteAllTodo();
    getTodos();
  }
}
