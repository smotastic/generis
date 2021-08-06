import 'dart:math';

class Generis {
  static Generis get I => Generis();

  List<T> get<T>(int amount) {
    final gen = _generators[T]!;
    return _numbers.take(amount).map((e) => gen.generateRandom() as T).toList();
  }

  Iterable<int> get _numbers sync* {
    int i = 0;
    while (true) yield i++;
  }

  static Map<dynamic, Generator> _generators = {};

  static void put(dynamic key, Generator val) {
    _generators.putIfAbsent(key, () => val);
  }
}

abstract class Generator<T> {
  // final _strings = ['bulbasaur', 'ivysaur', 'venosaur'];
  // final _ints = [1, 2, 3, 4];
  final _random = new Random();
  T generateRandom();
}
