import 'package:flutter/material.dart';
import 'package:my_project/components/custom_form_textfield_component.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController taskNameCustomTextFormFieldController =
      TextEditingController();
  TextEditingController difficultyLevelCustomTextFormFieldController =
      TextEditingController();
  TextEditingController imageController = TextEditingController();

  // Função para chamar setState e atualizar a UI
  void updateImage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'New task',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
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
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: taskNameCustomTextFormFieldController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.task_alt,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Task name',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
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
                  controller: difficultyLevelCustomTextFormFieldController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
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
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
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
                  controller: imageController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
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
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
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
              Container(
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
                    imageController.text.isEmpty
                        ? 'https://via.placeholder.com/150'
                        : imageController.text,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
