import 'package:angular2/angular2.dart';

import '../../common.dart';

import 'basket_drop_directive.dart';

@Component(
  selector: 'drag-drop-example-20',
  templateUrl: 'drag_drop_20.html',
  styleUrls: const ['drag_drop_20.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent,
    CustomDropDirective
  ]
)
class DragDropExample20Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final DragDropModelStorage storage;
  final Basket<FruitModel> basket1 = new Basket<FruitModel>();
  final Basket<FruitModel> basket2 = new Basket<FruitModel>();

  DragOptions basketDragOptions = new DragOptions(
    selector: 'basket-component'
  );

  DropOptions basketDropOptions = new DropOptions(
    canEnter: (DragSource source) => source.model is Basket<FruitModel>
  );

  DragOptions fruitDragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DropOptions fruitDropOptions = new DropOptions(
    canEnter: (DragSource source) => source.model is FruitModel
  );

  DragDropExample20Component(this.fruits, this.handler, this.storage) {
    basket1.addAll(fruits.getFruits(6));
    basket2.addAll(fruits.getFruits(1));
  }

  void onDrop(DropEvent event) {
    if (event.source.model is FruitModel) {
      FruitModel fruit = event.source.model;
      Basket<FruitModel> targetBasket = storage.getModel(event.target.container) as Basket<FruitModel>;
      targetBasket.items.add(fruit);
      basket1.items.remove(fruit);
    }
  }

  void onCustomDrop(DropEvent event) {
    if (event.source.model is Basket<FruitModel>) {
      Basket<FruitModel> basket = event.source.model;
      Basket<FruitModel> targetBasket = storage.getModel(event.target.container) as Basket<FruitModel>;

      targetBasket.items.addAll(basket.items);
      basket.items.clear();
    }
  }
}
