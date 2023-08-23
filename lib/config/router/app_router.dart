import 'package:form_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: HomeScreen.name, builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/cubit', name: CubitCounterScreen.name, builder: (context, state) => const CubitCounterScreen()),
    GoRoute(path: '/bloc', name: BlocCounterScreen.name, builder: (context, state) => const BlocCounterScreen()),
    GoRoute(path: '/register_user', name: RegisterScreen.name, builder: (context, state) => const RegisterScreen()),
  ]
);
