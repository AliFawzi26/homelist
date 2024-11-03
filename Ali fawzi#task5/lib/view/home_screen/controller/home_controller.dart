import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:homework_list/Core/local_storge/sqfilte_config.dart';

class HomeController extends GetxController {
  SqfliteConfg sql = SqfliteConfg();
  List<Map<String, dynamic>> taskList = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  Future<void> fetchTasksFromDB() async {
    List<Map> res = await sql.getAllTasks();
    taskList = List<Map<String,dynamic>>.from(res);
    update();
  }


  Future<void> addTask(String title, String description) async {
    await sql.insertTask(title, description);
    fetchTasksFromDB();
  }


  Future<void> deleteTask(int id) async {
    await sql.deleteData('DELETE FROM tasks WHERE id = $id');
    fetchTasksFromDB();
  }


  Future<void> updateTask(int id, String title, String description) async {
    await sql.updateData(
        'UPDATE tasks SET title = ?, description = ? WHERE id = ?',
        [title, description, id]
    );
    fetchTasksFromDB();
  }
}
