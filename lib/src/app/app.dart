import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/config.dart';
import '../modules/export_modules.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => UserRepository()),
          RepositoryProvider(
              create: (context) => AuthRepository(
                    userRepository: context.read<UserRepository>(),
                  )),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => AuthBloc(
                      authRepository: context.read<AuthRepository>(),
                      userRepository: context.read<UserRepository>(),
                    )),
            BlocProvider(
                create: (_) => WishlistBloc(
                      localStorageRepository: LocalStorageRepository(),
                    )..add(StartWishlist())),
            BlocProvider(
                create: (_) => CategoryBloc(
                      categoryRepository: CategoryRepository(),
                    )..add(LoadCategories())),
            BlocProvider(
                create: (_) => ProductBloc(
                      productRepository: ProductRepository(),
                    )..add(LoadProducts())),
            BlocProvider(
                create: (context) =>
                    SearchBloc(productBloc: context.read<ProductBloc>())
                      ..add(LoadSearch())),
            BlocProvider(
                create: (_) => CartBloc(
                      localStorageRepository: LocalStorageRepository(),
                    )..add(LoadCart())),
            BlocProvider(
                create: (_) => PaymentBloc()..add(LoadPaymentMethod())),
            BlocProvider(
                create: (context) => CheckoutBloc(
                      cartBloc: context.read<CartBloc>(),
                      paymentBloc: context.read<PaymentBloc>(),
                      checkoutRepository: CheckoutRepository(),
                    )),
            BlocProvider(
                create: (context) => LoginCubit(
                      authRepository: context.read<AuthRepository>(),
                    )),
            BlocProvider(
                create: (context) => RegisterCubit(
                      authRepository: context.read<AuthRepository>(),
                    )),
          ],
          child: MaterialApp(
            title: 'Ecommerce App',
            debugShowCheckedModeBanner: false,
            theme: getApplicationTheme(),
            onGenerateRoute: RouteGenerator.onGenerateRoute,
            initialRoute: AppRoutes.splashRoute,
          ),
        ),
      ),
    );
  }
}
