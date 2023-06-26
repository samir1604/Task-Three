void main() {
  final result = groupByOwners({
    'Input.txt': 'Randy',
    'Code.py': 'Stan',
    'table2.xls': 'John',
    'Output.txt': 'Randy',
    '': 'Ernest',
    'table1.xls': 'John',
    'table3.xls': 'John',
  });

  print(result);
}

Map<String, List<String>> groupByOwners(Map<String, String> files) {
  Map<String, List<String>> result = {};

  files.forEach(
      (filename, owner) => result[owner] = [...result[owner] ?? [], filename]);

  return result;
}
