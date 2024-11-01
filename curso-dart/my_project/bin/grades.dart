import 'dart:io';

validateInput(param) {
  String? input = stdin.readLineSync();

  if (input != null && input != "") {
    if (param.runtimeType == double) {
      return param = double.parse(input);
    } else {
      return param = input;
    }
  } else {
    if (param.runtimeType == double) {
      return 0.0;
    } else {
      return '';
    }
  }
}

String getOption() {
  print('Select an option:\n1- Add grade\n2- List grades\n3- Quit');

  String option = '';

  return validateInput(option);
}

addGrade(List<double> grades) {
  double grade = 0.0;

  print('Insert a grade:');

  grade = validateInput(grade);

  grades.add(grade);
}

listGrades(List<double> grades) {
  for (var grade in grades.asMap().entries) {
    print('Grade ${grade.key + 1}: ${grade.value}');
  }
}

void main() {
  List<double> grades = [];

  List<String> options = <String>['1', '2', '3'];

  String isContinue = '';

  do {
    String option = '';

    do {
      option = getOption();

      if (!options.contains(option)) {
        print('Select a valid option...');
      }
    } while (!options.contains(option));

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

    print('Should continue? (Y/N)');

    isContinue = stdin.readLineSync()!.toUpperCase();
  } while (isContinue != 'N');
}
