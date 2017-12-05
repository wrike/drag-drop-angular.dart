import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:drag_drop/drag_drop.dart';

import 'base_drag_drop_directive.dart';


@Directive(
  selector: '[drop-options]'
)
class DropDirective extends BaseDragDropDirective implements AfterViewChecked, AfterViewInit, OnDestroy, OnChanges {

  @Input('drop-options') DropOptions options;

  @Output() Stream<DragEnterEvent> get onDragEnter => dragEnterStream;
  @Output() Stream<DragSpringEnterEvent> get onDragSpringEnter => dragSpringEnterStream;
  @Output() Stream<DragOverEvent> get onDragOver => dragOverStream;
  @Output() Stream<DragLeaveEvent> get onDragLeave => dragLeaveStream;
  @Output() Stream<DropEvent> get onDrop => dropStream;

  DropDirective(NgZone ngZone, DragDropSubscriptionFactory subscriptionFactory, ElementRef elRef): super(ngZone, subscriptionFactory, elRef);

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    setOptions(options);
  }

}

