import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/page1',
  routes: [

    ///* Auth Routes
    GoRoute(
      path: '/page1',
      builder: (context, state) => const Page1Screen(),
    ),
    GoRoute(
      path: '/page2',
      builder: (context, state) => const Page2Screen(),
    ),
    
  ],
);