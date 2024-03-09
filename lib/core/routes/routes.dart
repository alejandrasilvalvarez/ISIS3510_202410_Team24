import 'package:get/route_manager.dart';

import '../../features/auth/presentation/pages/pages.dart';
import '../../features/classes_list/presentation/pages/pages.dart';
import '../../features/dashboard/presentation/pages/pages.dart';
import '../../features/profile_user/presentation/pages/pages.dart';

List<GetPage<dynamic>> get getRoutes {
  const Duration transitionDuration = Duration(milliseconds: 350);
  return <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: '/login',
      page: Login.new,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/register',
      page: RegisterView.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/forgot_password',
      page: ForgotPasswordView.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/dashboard_home',
      page: DashboardHome.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/classes_list',
      page: SubjectScreen.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/profile_user',
      page: ProfileUser.new,
      transitionDuration: transitionDuration,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),

  ];
}
