
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/const/app_colors.dart';
import '../controller/home_controller.dart';

class TaskDialog {
  final HomeController controller = Get.find<HomeController>();

  void showTaskDialog(BuildContext context, TextEditingController titleController, TextEditingController descriptionController, int? taskId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            taskId == null ? 'Add New Task' : 'Update Task',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Task Title',
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Task Description',
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                ),),],),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();},
              child: Text(
                'Exit',
                style: TextStyle(color: ColorManger.iconexite),  //
              ),),
            ElevatedButton(
              onPressed: () {
                if (taskId == null) {
                  controller.addTask(titleController.text, descriptionController.text);
                } else {
                  controller.updateTask(taskId, titleController.text, descriptionController.text);
                }
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                primary: ColorManger.background,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(taskId == null ? 'Add' : 'Update'),
            ),
          ],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        );
      },
    );
  }
}





