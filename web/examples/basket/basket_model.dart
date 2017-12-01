import 'dart:math';

class Basket<T> {

  final int id;
  final List<T> items = new List<T>();

  Basket([items]): id = new Random().nextInt(100000) {
    if (items != null) {
      this.items.add(items);
    }
  }

  void add(T item) => this.items.add(item);
  void addAll(Iterable<T> items) => this.items.addAll(items);
  bool remove(T item) => items.remove(item);
  void clear() => this.items.clear();
  int get count => this.items.length;
}
