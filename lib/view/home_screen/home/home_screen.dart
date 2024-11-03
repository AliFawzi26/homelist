import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../Core/const/app_colors.dart';
import '../../../Core/responsive/responsive.dart';
import '../controller/home_controller.dart';
import '../widget/task dialog.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveConfig.setupResponsiveWrapper(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'Homework List',
              style: TextStyle(fontWeight: FontWeight.bold, color: ColorManger.white),
            ),
            backgroundColor: ColorManger.background
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            controller.fetchTasksFromDB();
            return Stack(
              children: [
                controller.taskList.isEmpty
                    ? Center(
                  child: Text(
                    'No current tasks',
                    style: TextStyle(fontSize: 18, color: ColorManger.text),
                  ),
                )
                    : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  itemCount: controller.taskList.length,
                  itemBuilder: (context, index) {
                    var task = controller.taskList[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(
                          task['title'],
                          style: TextStyle(fontWeight: FontWeight.bold, color: ColorManger.black),
                        ),
                        subtitle: Text(task['description']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: ColorManger.iconedite),
                              onPressed: () {
                                controller.titleController.text = task['title'];
                                controller.descriptionController.text = task['description'];
                                TaskDialog().showTaskDialog(
                                  context,
                                  controller.titleController,
                                  controller.descriptionController,
                                  task['id'],
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: ColorManger.icondelete),
                              onPressed: () {
                                controller.deleteTask(task['id']);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: FloatingActionButton(
                    child: Icon(Icons.add, color: ColorManger.white),
                    backgroundColor: ColorManger.backgroundColorfloatbtn,
                    onPressed: () {
                      controller.titleController.clear();
                      controller.descriptionController.clear();
                      TaskDialog().showTaskDialog(
                        context,
                        controller.titleController,
                        controller.descriptionController,
                        null,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

