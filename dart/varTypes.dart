import 'dart:ffi';

main() {
  var a = 3;
  a = 4;

  final b = 3;

  const c = 5;

  dynamic x = 'Teste';
  x = 123;
  print(x);

  Map<String, double> notasDosAlunos = {
    "pedro": 8.3,
    "marcos": 9.5,
    "Jurema": 7.8
  };

  for (var key in notasDosAlunos.keys) {
    print(key);
  }
  ;

  for (var value in notasDosAlunos.values) {
    print(value);
  }
  ;

  for (var entrie in notasDosAlunos.entries) {
    print('${entrie.key} = ${entrie.value}');
  }
  ;
}
