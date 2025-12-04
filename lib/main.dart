import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_orangebayhurghada/core/utils/app_theme.dart';
import 'package:task_orangebayhurghada/core/utils/service_locator.dart';
import 'package:task_orangebayhurghada/features/banners/viewmodel/banners_cubit.dart';
import 'package:task_orangebayhurghada/features/home/view/ui/home_screen.dart';
import 'package:task_orangebayhurghada/features/product_details/viewmodel/product_details_cubit.dart';
import 'package:task_orangebayhurghada/features/products/viewmodel/products_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<ProductsCubit>()),
        BlocProvider(create: (context) => getIt.get<ProductDetailsCubit>()),
        BlocProvider(create: (context) => getIt.get<BannersCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: HomeScreen(),
      ),
    );
  }
}
