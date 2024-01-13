import 'package:expense_tracker/screens/authentication/register.dart';
import 'package:expense_tracker/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
    // redirect: (context, state) {
    //   // FirebaseAuth auth = FirebaseAuth.instance;

    //   // if (auth.currentUser != null) {
    //     return '/dashboard';
    //   }
    //   // return "/";
    // },
    
  ),
  GoRoute(
    path: '/register_screen',
    builder: (context, state) => const RegisterScreen(),
  )
]);
