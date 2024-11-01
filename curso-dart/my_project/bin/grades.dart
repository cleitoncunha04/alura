import 'dart:io';

double validateInput(double param) {
  String? input = stdin.readLineSync();

  if (input != null && input.isNotEmpty) {
    return double.parse(input);
  } else {
    return 0.0;
  }
}

String getOption() {
  print('Select an option:\n1- Add grade\n2- List grades\n3- Quit');
  String? option = stdin.readLineSync();
  return option ?? '';
}

void addGrade(List<double> grades) {
  print('Insert a grade:');
  double grade = validateInput(0.0);

  if (grade > 10) {
    print('Insert a valid grade...');

    addGrade(grades);

    return;
  }

  grades.add(grade);
}

void listGrades(List<double> grades) {
  if (grades.isEmpty) {
    print('No grades available.');
  } else {
    for (var grade in grades.asMap().entries) {
      print('Grade ${grade.key + 1}: ${grade.value}');
    }
  }
}

void showAsciiArt() {
  print(" ______  ______  ______  _____   ______  ______    ");
  print("/\\  ___\\/\\  == \\/\\  __ \\/\\  __-./\\  ___\\/\\  ___\\   ");
  print("\\ \\ \\__ \\ \\  __<\\ \\  __ \\ \\ \\/\\ \\ \\  __\\\\ \\___  \\  ");
  print(" \\ \\_____\\ \\_\\ \\_\\ \\_\\ \\_\\ \\____-\\ \\_____\\/\\_____\\ ");
  print("  \\/_____/\\/_/ /_/\\/_/\\/_/\\/____/ \\/_____/\\/_____/ ");
  print("                                                   ");
}

void showMenu(List<String> options, List<double> grades) {
  String option;

  do {
    print('');

    showAsciiArt();

    print('');

    option = getOption();

    print('');

    if (!options.contains(option)) {
      print('Select a valid option...');
      continue; // Retorna ao início do loop se a opção não for válida
    }

    switch (option) {
      case '1':
        addGrade(grades);
        break;
      case '2':
        listGrades(grades);
        break;
      case '3':
        print('Closing...');
        exit(0);
      default:
        print('Select a valid option...');
    }
  } while (true);
}

void main() {
  List<double> grades = [];
  List<String> options = <String>['1', '2', '3'];

  showMenu(options, grades);
}
