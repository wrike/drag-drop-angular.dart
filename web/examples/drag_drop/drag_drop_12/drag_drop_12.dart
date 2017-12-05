import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-12',
  templateUrl: 'drag_drop_12.html',
  styleUrls: const ['drag_drop_12.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample12Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final DragDropModelStorage storage;

  final Basket<FruitModel> managedBasket = new Basket<FruitModel>();
  final Basket<FruitModel> unmanagedBasket = new Basket<FruitModel>();

//  FruitModel _getFruit(FruitType type) =>
//    basket.items.firstWhere((FruitModel model) => model.type == type);
//
//  FruitModel get banana => _getFruit(FruitType.banana);
//  FruitModel get plum => _getFruit(FruitType.plum);

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DragDropExample12Component(this.fruits, this.handler, this.storage) {
    managedBasket.addAll(fruits.getFruits(7));
    unmanagedBasket.addAll(fruits.getFruits(7));
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);
}
