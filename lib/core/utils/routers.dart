import 'package:bookly_app/core/utils/service_locator_gitit.dart';
import 'package:bookly_app/features/home/data/repos/home_reop_imp.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_screen.dart';
import 'package:bookly_app/features/home/presentation/views/home_screen.dart';
import 'package:bookly_app/features/home/presentation/views_model/cubits/similar_book_cubit/similar_book_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search_screen.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        // step 4 in cubit provide the cubit to the book details screen only
        // dont make it in main to use it in book detaails only
        // only the book details screen will have access to the cubit and the methods in it
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBookCubitCubit(getIt.get<HomeRepoImp>()),
          // send data from home screen to book details screen using extra in go router
          child: BookDetailsScreen(bookmodel: state.extra as dynamic),
        ),
      ),

      GoRoute(
        path: '/searchbooks',
        builder: (context, state) => SearchScreen(),
      ),
    ],
  );
}
