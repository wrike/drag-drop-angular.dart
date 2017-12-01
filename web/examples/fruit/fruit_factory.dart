import 'dart:math';

import 'package:angular2/di.dart';

import 'fruit_model.dart';

@Injectable()
class FruitFactory {

  final Random _rnd = new Random();

  FruitModel getBanana() => getFruit(FruitType.banana, FruitSize.ExtraSmall.maxSize);
  FruitModel getPlum() => getFruit(FruitType.plum, FruitSize.Small.maxSize);
  FruitModel getKiwi() => getFruit(FruitType.kiwi, FruitSize.Medium.maxSize);
  FruitModel getOrange() => getFruit(FruitType.orange, FruitSize.Large.maxSize);
  FruitModel getWatermelon() => getFruit(FruitType.watermelon, FruitSize.ExtraLarge.maxSize);
  FruitModel getPapaya() => getFruit(FruitType.papaya, FruitSize.Large.maxSize);
  FruitModel getLime() => getFruit(FruitType.lime, FruitSize.Medium.maxSize);
  FruitModel getApricot() => getFruit(FruitType.apricot, FruitSize.Medium.maxSize);

  FruitModel getFruit(FruitType type, int size) {
    return new FruitModel(_rnd.nextInt(100000), type, size);
  }

  FruitModel getRandomFruit() {
    return getFruits(1).first;
  }

  List<FruitModel> getFruits(int count) {
    return new List<FruitModel>.generate(count, (int c) {
      List<FruitModel> fruits = new List<FruitModel>.from([
        getBanana(),
        getBanana(),
        getPlum(),
        getLime(),
        getLime(),
        getApricot(),
        getApricot(),
        getKiwi(),
        getKiwi(),
        getPapaya(),
        getOrange(),
        getWatermelon()
      ]);
      return fruits.elementAt(_rnd.nextInt(fruits.length));
    });
  }

}
