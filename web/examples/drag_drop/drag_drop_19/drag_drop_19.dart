import 'package:angular2/angular2.dart';

import '../../common.dart';


@Component(
  selector: 'drag-drop-example-19',
  templateUrl: 'drag_drop_19.html',
  styleUrls: const ['drag_drop_19.css'],
  directives: const [
    CORE_DIRECTIVES,
    DRAG_DROP_DIRECTIVES,
    BasketComponent,
    FruitComponent
  ]
)
class DragDropExample19Component {

  final FruitFactory fruits;
  final ExampleEventsHandler handler;
  final Basket<FruitModel> basket = new Basket<FruitModel>();

  DragOptions dragOptions = new DragOptions(
    selector: 'fruit-component'
  );

  DropOptions _dropOptions;
  DropOptions get dropOptions {
    if (_dropOptions == null) {
      _dropOptions = new DropOptions(
        beforeDrop: (DragSource source, DropTarget target, DragDropSimpleData data, MouseEvent event) {
          (source.model as FruitModel).note = data.getData('text/plain');
        },
        provideRawDataModel: (DataTransfer data) {
          return fruits.getRandomFruit();
        }
      );
    }
    return _dropOptions;
  }

  DragDropExample19Component(this.fruits, this.handler) {
    basket.addAll(fruits.getFruits(1));
  }

  void onDrop(DropEvent event) => handler.onDrop(event);
}
