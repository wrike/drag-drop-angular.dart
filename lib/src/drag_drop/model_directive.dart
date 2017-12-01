import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:drag_drop/drag_drop.dart';


@Directive(
  selector: '[drag-drop-model]'
)
class DragDropModelDirective implements AfterViewInit, OnDestroy, OnChanges {

  @Input('drag-drop-model') dynamic model;

  final DragDropModelStorage _modelStorage;
  final NgZone ngZone;
  final ElementRef elRef;

  dynamic _currentModel;

  Element get el => elRef?.nativeElement;

  DragDropModelDirective(this.elRef, this.ngZone, this._modelStorage);

  @override
  void ngAfterViewInit() {
    ngZone.runOutsideAngular(() {
      _attachModel(model);
    });
  }

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    ngZone.runOutsideAngular(() {
      _attachModel(model);
    });
  }

  @override
  void ngOnDestroy() {
    ngZone.runOutsideAngular(() {
      _modelStorage.detach(el);
    });
  }

  void _attachModel(dynamic model) {
    if (model != _currentModel) {
      if (_currentModel != null) {
        _modelStorage.detach(el);
      }
      if (model != null) {
        _modelStorage.attach(el, model);
      }
      _currentModel = model;
    }
  }

}
