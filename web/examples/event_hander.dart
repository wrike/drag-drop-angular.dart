import 'package:angular2/di.dart';
import 'package:drag_drop_angular/drag_drop.dart';

import 'basket/basket_model.dart';
import 'fruit/fruit_model.dart';


@Injectable()
class ExampleEventsHandler {

  final DragDropModelStorage modelStorage;

  ExampleEventsHandler(this.modelStorage);

  void onDragStart(DragStartEvent event) {
    _processDragStartEndEvents(event, 'Drag start for');
  }

  void onDragEnd(DragEndEvent event) {
    _processDragStartEndEvents(event, 'Drag end for');
  }

  void onDragEnter(DragEnterEvent event) {
    _processEnterLeaveEvents(event, 'Drag enter with');
  }

  void onDragSpringEnter(DragSpringEnterEvent event) {
    _processEnterLeaveEvents(event, 'Drag spring enter with');
  }

  void onDragLeave(DragLeaveEvent event) {
    _processEnterLeaveEvents(event, 'Drag leave with');
  }

  void onDrop(DropEvent event) {
    _processDropEvents(event, 'Drop of');
  }

  void onCustomDragStart(DragStartEvent event) {
    _processDragStartEndEvents(event, 'Custom drag start for');
  }

  void onCustomDragEnd(DragEndEvent event) {
    _processDragStartEndEvents(event, 'Custom drag end for');
  }

  void onCustomDragEnter(DragEnterEvent event) {
    _processEnterLeaveEvents(event, 'Custom drag enter with');
  }

  void onCustomDragSpringEnter(DragSpringEnterEvent event) {
    _processEnterLeaveEvents(event, 'Custom drag spring enter with');
  }

  void onCustomDragLeave(DragLeaveEvent event) {
    _processEnterLeaveEvents(event, 'Custom drag leave with');
  }

  void onCustomDrop(DropEvent event) {
    _processDropEvents(event, 'Custom drop of');
  }

  void _processDragStartEndEvents(BaseDragEvent event, String actionDescription) {
    Basket<FruitModel> sourceBasket;
    dynamic containerModel = modelStorage.getModel(event.source.container);
    if (containerModel is Basket<FruitModel>) {
      sourceBasket = containerModel;
    }

    Basket<FruitModel> basket;
    FruitModel fruit;

    dynamic model = event.source.model;
    if (model is FruitModel) {
      fruit = model;
    }
    else if (model is Basket<FruitModel>) {
      basket = model;
    }

    _logEventDetails(sourceBasket, basket, fruit, actionDescription);

  }

  void _processEnterLeaveEvents(BaseDragDropEvent event, String actionDescription) {
    Basket<FruitModel> targetBasket = modelStorage.getModel(event.target.container);

    Basket<FruitModel> basket;
    FruitModel fruit;
    dynamic model = event.source.model;

    if (model is FruitModel) {
      fruit = model;
    }
    else if (model is Basket<FruitModel>) {
      basket = model;
    }
    _logEventDetails(targetBasket, basket, fruit, actionDescription);
  }

  void _processDropEvents(DropEvent event, String actionDescription) {
    Basket<FruitModel> sourceBasket = modelStorage.getModel(event.source.container);
    Basket<FruitModel> targetBasket = modelStorage.getModel(event.target.container);

    FruitModel fruit = event.source.model as FruitModel;

    targetBasket.add(fruit);
    if (sourceBasket != null) {
      sourceBasket?.remove(fruit);
      print('Basket ${targetBasket.id}: $actionDescription ${fruit.typeName} (${fruit.id}) from basket ${sourceBasket.id}');
    }
    else {
      print('Basket ${targetBasket.id}: $actionDescription ${fruit.typeName} (${fruit.id})');
    }
  }

  void _logEventDetails(Basket<FruitModel> targetBasket, Basket<FruitModel> sourceBasket, FruitModel sourceFruit, String actionDescription) {
    if (targetBasket != null) {
      if (sourceFruit != null) {
        print('Basket ${targetBasket.id}: $actionDescription ${sourceFruit.typeName} (${sourceFruit.id})');
      }
      else if (sourceBasket != null) {
        print('Basket ${targetBasket.id}: $actionDescription basket (${sourceBasket.id})');
      }
      else {
        print('Basket ${targetBasket.id}: $actionDescription unknown model');
      }
    }
    else {
      if (sourceFruit != null) {
        print('$actionDescription ${sourceFruit.typeName} (${sourceFruit.id})');
      }
      else if (sourceBasket != null) {
        print('$actionDescription basket (${sourceBasket.id})');
      }
      else {
        print('$actionDescription unknown model');
      }
    }
  }

}
