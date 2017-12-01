import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:drag_drop/drag_drop.dart';

import 'base_drag_drop_directive.dart';


@Directive(
  selector: '[drag-options]'
)
class DragDirective extends BaseDragDropDirective implements AfterViewChecked, AfterViewInit, OnDestroy, OnChanges {

  @Input('drag-options') DragOptions options;

  @Output() Stream<DragStartEvent> get onDragStart => dragStartStream;
  @Output() Stream<DragEndEvent> get onDragEnd => dragEndStream;

  DragDirective(NgZone ngZone, DragDropSubscriptionFactory subscriptionFactory, ElementRef elRef): super(ngZone, subscriptionFactory, elRef);

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    setOptions(options);
  }

}

