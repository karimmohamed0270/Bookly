import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/routers.dart';
import 'package:bookly_app/core/utils/service_locator_gitit.dart';
import 'package:bookly_app/features/home/data/repos/home_reop_imp.dart';
import 'package:bookly_app/features/home/presentation/views_model/cubits/featured_book_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views_model/cubits/newest_book_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // create: (context) => NewestBooksCubit(HomeRepoImp(Apiservice(Dio()))),
          // this above code not good but it will work
          // i will use get it in the future to make it better and cleaner
          // make file called service locater in utils and get from it the code that i will use
          // NewestBooksCubit(getIt.get<HomeRepoImp>()) is the step 4
          // .. is the step 6
          // in it because no reason i just want to show the data make 2*1
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImp>())..featchFeauredBooks(),
        ),
        BlocProvider(
          // create: (context) => FeaturedBooksCubit(HomeRepoImp(Apiservice(Dio()))),
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImp>()),
        ),
      ],
      child: MaterialApp.router(
        // in utils the path for each screen to navigate
        routerConfig: AppRouters.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          // use google fonts for the whole app inside the theme to make it easier to change the font
          // ThemeData.dark().textTheme write only in the dark theme
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
