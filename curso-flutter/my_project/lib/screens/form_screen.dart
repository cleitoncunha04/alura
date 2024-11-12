import 'package:flutter/material.dart';
import 'package:my_project/components/custom_form_textfield_component.dart';
import 'package:my_project/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    required this.taskContext,
    super.key,
  });

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    return value != null && value.isEmpty;
  }

  bool difficultyValidator(String? value) {
    return valueValidator(value) ||
        int.parse(value!) < 1 ||
        int.parse(value) > 5;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'New task',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 550,
              width: 470,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(
                  width: 3,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Please fill the field...';
                        } else {
                          return null;
                        }
                      },
                      controller: nameController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 5,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.task,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Task name',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (difficultyValidator(value)) {
                          return 'Please  fill the field correctly...';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 5,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.star,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Difficulty level',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please fill the field';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 5,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Image url...',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          imageController.text,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTtace) {
                            return Container(
                              alignment: AlignmentDirectional.center,
                              child: const Icon(
                                Icons.hide_image,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          )),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(
                              '${nameController.text}, ${difficultyController.text}, ${imageController.text}');

                          TaskInherited.of(widget.taskContext)!.newTask(
                            nameController.text,
                            int.parse(difficultyController.text),
                            imageController.text,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Saving new task...'),
                            ),
                          );

                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        'Add task',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
