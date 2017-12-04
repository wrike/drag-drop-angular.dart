import 'package:angular2/di.dart';
import 'package:drag_drop/drag_drop.dart';
import 'package:user_environment_angular/user_environment_angular.dart';

import '../../scroll.dart';


@Injectable()
DragDropSubscriptionFactory injectableDragDropSubscriptionFactoryFactory(
  @SkipSelf() @Optional() DragDropSubscriptionFactory subscriptionFactory,
  DragDropManager dragDropManager
) =>
  subscriptionFactory ?? DragDropSubscriptionFactoryFactory(
    dragDropManager: dragDropManager
  );

const Provider DragDropSubscriptionFactoryProvider =
  const Provider(DragDropSubscriptionFactory, useFactory: injectableDragDropSubscriptionFactoryFactory);


@Injectable()
DragDropModelStorage injectableDragDropModelStorageFactory(
  @SkipSelf() @Optional() DragDropModelStorage storage,
  NgZone zone
) =>
  storage ?? zone.runOutsideAngular(() =>
    DragDropModelStorageFactory()
  );

const Provider DragDropModelStorageProvider =
  const Provider(DragDropModelStorage, useFactory: injectableDragDropModelStorageFactory);


@Injectable()
DragDropReferenceManager injectableDragDropReferenceManagerFactory(
  @SkipSelf() @Optional() DragDropReferenceManager manager,
  DragDropElementManager elementManager,
  DragDropModelStorage modelStorage,
  NgZone zone
) =>
  manager ?? zone.runOutsideAngular(() =>
    DragDropReferenceManagerFactory(
      elementManager: elementManager,
      modelStorage: modelStorage
    )
  );

const Provider DragDropReferenceManagerProvider =
  const Provider(DragDropReferenceManager, useFactory: injectableDragDropReferenceManagerFactory);


@Injectable()
DragDropEventManager injectableDragDropEventManagerFactory(
  @SkipSelf() @Optional() DragDropEventManager manager,
  DragDropElementManager elementManager,
  DragDropContainer dragDropContainer,
  UserEnvironment environment,
  NgZone zone
) =>
  manager ?? zone.runOutsideAngular(() =>
    DragDropEventManagerFactory(
      elementManager: elementManager,
      dragDropContainer: dragDropContainer,
      environment: environment
    )
  );

const Provider DragDropEventManagerProvider =
  const Provider(DragDropEventManager, useFactory: injectableDragDropEventManagerFactory);


@Injectable()
DragDropElementManager injectableDragDropElementManagerFactory(
  @SkipSelf() @Optional() DragDropElementManager manager,
  DragDropContainer dragDropContainer,
  DragGhostContainer ghostContainer,
  UserEnvironment environment,
  NgZone zone
) =>
  manager ?? zone.runOutsideAngular(() =>
    DragDropElementManagerFactory(
      dragDropContainer: dragDropContainer,
      ghostContainer: ghostContainer,
      environment: environment
    )
  );

const Provider DragDropElementManagerProvider =
  const Provider(DragDropElementManager, useFactory: injectableDragDropElementManagerFactory);


@Injectable()
DragDropContainer injectableDragDropContainerFactory(
  @SkipSelf() @Optional() DragDropContainer container
) =>
  container ?? DragDropContainerFactory();

const Provider DragDropContainerProvider =
  const Provider(DragDropContainer, useFactory: injectableDragDropContainerFactory);


@Injectable()
DragGhostContainer injectableDragGhostContainerFactory(
  @SkipSelf() @Optional() DragGhostContainer container
) =>
  container ?? DragGhostContainerFactory();

const Provider DragGhostContainerProvider =
  const Provider(DragGhostContainer, useFactory: injectableDragGhostContainerFactory);


@Injectable()
DragDropManager injectableDragDropManagerFactory(
  @SkipSelf() @Optional() DragDropManager manager,
  ScrollManager scrollManager,
  DragDropElementManager elementManager,
  MovementManager movementManager,
  DragDropEventManager eventManager,
  DragDropReferenceManager referenceManager,
  NgZone zone
) =>
  manager ?? zone.runOutsideAngular(() =>
    DragDropManagerFactory(
      scrollManager: scrollManager,
      elementManager: elementManager,
      movementManager: movementManager,
      eventMananger: eventManager,
      referenceManager: referenceManager
    )
  );

const Provider DragDropManagerProvider =
  const Provider(DragDropManager, useFactory: injectableDragDropManagerFactory);


const DRAG_DROP_PROVIDERS = const [
  USER_ENVIRONMENT_PROVIDERS,
  SCROLL_PROVIDERS,
  DragDropSubscriptionFactoryProvider,
  DragDropModelStorageProvider,
  DragDropReferenceManagerProvider,
  DragDropEventManagerProvider,
  DragDropElementManagerProvider,
  DragDropContainerProvider,
  DragGhostContainerProvider,
  DragDropManagerProvider
];

