import 'package:angular2/di.dart';
import 'package:drag_drop/scroll.dart';

import '../../movement.dart';


@Injectable()
ScrollContainer injectableScrollContainerFactory(
  @SkipSelf() @Optional() ScrollContainer container
) =>
  container ?? ScrollContainerFactory();

const Provider ScrollContainerProvider =
  const Provider(ScrollContainer, useFactory: injectableScrollContainerFactory);


@Injectable()
ScrollOptions injectableScrollOptionsFactory(
  @SkipSelf() @Optional() ScrollOptions options
) =>
  options ?? ScrollOptionsFactory();

const Provider ScrollOptionsProvider =
  const Provider(ScrollOptions, useFactory: injectableScrollOptionsFactory);


@Injectable()
ScrollManager injectableScrollManagerFactory(
  @SkipSelf() @Optional() ScrollManager manager,
  MovementManager movementManager,
  ScrollContainer scrollContainer,
  ScrollOptions scrollOptions,
  NgZone zone
) =>
  manager ?? zone.runOutsideAngular(() =>
    ScrollManagerFactory(
      movementManager: movementManager,
      scrollContainer: scrollContainer,
      scrollOptions: scrollOptions
    )
  );

const Provider ScrollManagerProvider =
  const Provider(ScrollManager, useFactory: injectableScrollManagerFactory);


const SCROLL_PROVIDERS = const [
  MOVEMENT_PROVIDERS,
  ScrollContainerProvider,
  ScrollOptionsProvider,
  ScrollManagerProvider
];
