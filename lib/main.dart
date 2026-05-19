// import 'package:bookly_app/constants.dart';
// import 'package:bookly_app/core/utils/routers.dart';
// import 'package:bookly_app/core/utils/service_locator_gitit.dart';
// import 'package:bookly_app/features/home/data/repos/home_reop_imp.dart';
// import 'package:bookly_app/features/home/presentation/views_model/cubits/featured_book_cubit/featured_books_cubit.dart';
// import 'package:bookly_app/features/home/presentation/views_model/cubits/newest_book_cubit/newest_books_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   setup();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) =>
//               FeaturedBooksCubit(getIt.get<HomeRepoImp>())
//                 ..fetchFeaturedBooks(),
//         ),

//         BlocProvider(
//           create: (context) =>
//               NewestBooksCubit(getIt.get<HomeRepoImp>())..fetchNewestBooks(),
//         ),
//       ],

//       child: MaterialApp.router(
//         routerConfig: AppRouters.router,

//         debugShowCheckedModeBanner: false,

//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: kPrimaryColor,

//           textTheme: GoogleFonts.montserratTextTheme(
//             ThemeData.dark().textTheme,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/routers.dart';
import 'package:bookly_app/core/utils/service_locator_gitit.dart';
import 'package:bookly_app/features/home/data/repos/home_reop_imp.dart';
import 'package:bookly_app/features/home/presentation/views_model/cubits/featured_book_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views_model/cubits/newest_book_cubit/newest_books_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();

  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImp>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImp>())..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,

        routerConfig: AppRouters.router,
        debugShowCheckedModeBanner: false,

        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
