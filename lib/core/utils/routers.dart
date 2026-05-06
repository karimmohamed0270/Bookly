import 'package:bookly_app/features/home/presentation/views/book_details_screen.dart';
import 'package:bookly_app/features/home/presentation/views/home_screen.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(
        //  intial screen
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),

      // Route 2 for Home Screen
      GoRoute(
        //  intial screen
        path: '/homescreen',
        builder: (context, state) => HomeScreen(),
      ),

      // Route 3 for Book Details Screen
      GoRoute(
        path: '/bookdetails',
        builder: (context, state) => BookDetailsScreen(),
      ),
    ],
  );
}
