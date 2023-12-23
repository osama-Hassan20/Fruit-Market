import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_ecommerce/features/admin/presentation/manager/add_and_update_product_cubit/cubit.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'core/constants/variables.dart';
import 'core/controllers/blocobserver.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'features/admin/presentation/manager/get_product_cubit/cubit.dart';
import 'features/splash/presentation/splash_view.dart';
import 'features/user/favourite/presentation/manager/favourite _cubit/cubit.dart';
import 'features/user/layout/presentation/manager/user_layout_cubit/cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  isAdmin = CacheHelper.getData(key: 'isAdmin');
  print(isAdmin);
  uId = CacheHelper.getData(key: 'uId');
  onBoarding = CacheHelper.getData(key:'onBoarding');
  // isAdmin = CacheHelper.getData(key:'isAdmin');

print(uId);
  runApp(const FruitsMarket());
}


class FruitsMarket extends StatelessWidget {
  const FruitsMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>AddAndUpdateProductCubit()
        ),
        BlocProvider(
          create: (BuildContext context) =>GetProductCubit()..getProducts()
        ),
        BlocProvider(
          create: (BuildContext context) =>UserAppCubit()
        ),
        BlocProvider(
          create: (BuildContext context) =>UserFavoriteCubit()
        ),
      ],
      child:  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily:'Poppins',
        ),
        home: const SplashView(),
      ),
    );
  }
}
