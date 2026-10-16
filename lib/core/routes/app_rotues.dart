import 'package:go_router/go_router.dart';

import '../../features/details/presentions/view/product_details_screen.dart';
import '../../features/splash/screens/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return SplashScreen();
      }
      ),
        GoRoute(
          path: '/products/:productId',
          builder: (context, state) {
        return ProductDetailsScreen(productId: int.parse(state.pathParameters['productId']!));
      }
          
        ),
  ],
);