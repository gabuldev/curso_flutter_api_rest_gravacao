import 'dart:convert';

void main() {
  const json = '{"name": "Gabul"}'; // MAP,
  print(json);
  const jsonList = '[{"name": "Gabul"}]'; // LIST<MAP>,
  print(jsonList);
  const jsonComplex =
      '{"name": "Gabul", "enderecos" : [{"street" : " rua a" }]}'; // MAP,
  print(jsonComplex);
  final map = jsonDecode(json) as Map;
  print(map['name']);
  final list = jsonDecode(jsonList) as List;
  print(list[0]['name']);
  final complex = jsonDecode(jsonComplex) as Map;
  print(complex['enderecos'][0]['street']);
}
