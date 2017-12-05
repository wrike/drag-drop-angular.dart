import 'fruit_size.dart';
import 'fruit_type.dart';

export 'fruit_size.dart';
export 'fruit_type.dart';

class FruitModel {

  final int id;
  final FruitType type;
  final int size;
  String note;

  FruitSize get sizeType {
    if (size <= FruitSize.ExtraSmall.maxSize) {
      return FruitSize.ExtraSmall;
    }
    if (size <= FruitSize.Small.maxSize) {
      return FruitSize.Small;
    }
    if (size <= FruitSize.Medium.maxSize) {
      return FruitSize.Medium;
    }
    if (size <= FruitSize.Large.maxSize) {
      return FruitSize.Large;
    }
    if (size <= FruitSize.ExtraLarge.maxSize) {
      return FruitSize.ExtraLarge;
    }
    return FruitSize.ExtraExtraLarge;
  }

  String get typeName => type.name;

  FruitModel(this.id, this.type, this.size, [this.note]);

  @override
  String toString() => type.name;
}
