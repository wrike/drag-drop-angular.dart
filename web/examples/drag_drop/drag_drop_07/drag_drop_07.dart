import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-07',
  templateUrl: 'drag_drop_07.html',
  styleUrls: const ['drag_drop_07.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample07Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();

  List<FruitType> availableDragFruits = [
    FruitType.kiwi,
    FruitType.orange,
    FruitType.watermelon
  ];

  DragOptions _dragOptions;
  DragOptions get dragOptions {
    if (_dragOptions == null) {
      _dragOptions = new DragOptions(
        selector: 'fruit-component',
        canDrag: (DragSource source) {
          dynamic model = source.model;
          return model is FruitModel && availableDragFruits.contains(model.type);
        });
    }
    return _dragOptions;
  }

  DragDropExample07Component(this.fruits, this.handler) {
    basket.addAll(<FruitModel>[
      fruits.getKiwi(),
      fruits.getRandomFruit(),
      fruits.getOrange(),
      fruits.getRandomFruit(),
      fruits.getWatermelon(),
      fruits.getRandomFruit(),
      fruits.getRandomFruit(),
    ]);
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);

}
