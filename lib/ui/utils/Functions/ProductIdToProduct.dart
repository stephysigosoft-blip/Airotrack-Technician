// the function which converts product Id to product

String productIdToProduct(int digit) {
  switch (digit) {
    case 1:
      return 'GPS';
    case 2:
      return 'Camera';
    case 3:
      return 'Speed Governor';
    default:
      throw ArgumentError('Only digits 0–5 are allowed');
  }
}

String serviceIdToService(int digit) {
  switch (digit) {
    case 1:
      return 'New';
    case 2:
      return 'Repair';
    case 3:
      return 'Replacement';
    default:
      throw ArgumentError('Only digits 0–5 are allowed');
  }
}
