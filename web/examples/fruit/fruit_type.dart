class FruitType {

  final String color;
  final String name;

  static final FruitType banana = new FruitType._('Banana', '#f7e08b');
  static final FruitType plum = new FruitType._('Plum', '#a1b3e8');
  static final FruitType kiwi = new FruitType._('Kiwi', '#a8c84c');
  static final FruitType orange = new FruitType._('Orange', '#f8bb63');
  static final FruitType watermelon = new FruitType._('Watermelon', '#ffaca9');
  static final FruitType papaya = new FruitType._('Papaya', '#ff9163');
  static final FruitType lime = new FruitType._('Lime', '#e3e790');
  static final FruitType apricot = new FruitType._('Apricot', '#f9a253');

  FruitType._(this.name, this.color);
}
