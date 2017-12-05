class FruitSize {

  final String _label;
  final int maxSize;

  static final FruitSize ExtraSmall = new FruitSize._('XS', 20);
  static final FruitSize Small = new FruitSize._('S', 40);
  static final FruitSize Medium = new FruitSize._('M', 60);
  static final FruitSize Large = new FruitSize._('L', 80);
  static final FruitSize ExtraLarge = new FruitSize._('XL', 100);
  static final FruitSize ExtraExtraLarge = new FruitSize._('XXL', 120);

  FruitSize._(this._label, this.maxSize);

  String toString() => _label;
}
