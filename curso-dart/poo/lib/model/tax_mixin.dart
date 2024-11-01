mixin TaxMixin {
  double tax = 0.03;

  double calcTaxedValue(double value) {
    return value * tax;
  }
}