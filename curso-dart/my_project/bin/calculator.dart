import 'dart:io';

double sum(double n1, double n2) => n1 + n2;

double subtraction(double n1, double n2) => n1 - n2;

double multiplication(double n1, double n2) => n1 * n2;

double division(double n1, double n2) {
  if (n2 == 0) {
    print('Invalid number...');

    return double.nan;
  }

  return n1 / n2;
}

String getCalc() {
  print(
      'Select an option:\n1- Sum\n2- Subtraction\n3- Multiplication\n4- Division\n');

  print('Option:');

  String option = '';

  option = validateInput(option);

  return option;
}

validateInput(var param) {
  String? input = stdin.readLineSync();

  if (input != null && input != "") {
    if (param.runtimeType == double) {
      return param = double.parse(input);
    } else  {
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

void main() {
  String isCompleted = '';

  do {
    stdout.write('\x1B[2J\x1B[0;0H');

    String option = getCalc();

    print('Enter the first number:');
    double n1 = 0;
    n1 = validateInput(n1);

    print('Enter the second number: ');
    double n2 = 0;
    n2 = validateInput(n2);

    print('Result: ');

    switch (option) {
      case '1':
        print(sum(n1, n2));
        break;
      case '2':
        print(subtraction(n1, n2));
        break;
      case '3':
        print(multiplication(n1, n2));
        break;
      case '4':
        print(division(n1, n2));
        break;
      default:
        print('Please, select a valid option...');
        break;
    }

    print('Want to close the program? (Y/N)');

    isCompleted = stdin.readLineSync()!.toUpperCase();
  } while (isCompleted != 'Y');
}
