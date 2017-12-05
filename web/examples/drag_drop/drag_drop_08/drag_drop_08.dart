import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-08',
  templateUrl: 'drag_drop_08.html',
  styleUrls: const ['drag_drop_08.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample08Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final DragDropModelStorage storage;
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
        provideModel: (Element el) {
          int id = int.parse(el.attributes['id'], onError: (_) => -1);
          return basket.items.firstWhere((FruitModel m) => m.id == id, orElse: () => null);
        }
      );

    }
    return _dragOptions;
  }

  DragDropExample08Component(this.fruits, this.handler, this.storage) {
    basket.addAll(fruits.getFruits(7));
  }

  void onDragStart(DragStartEvent event) => handler.onDragStart(event);
  void onDragEnd(DragEndEvent event) => handler.onDragEnd(event);

}
