import 'package:get/route_manager.dart';

import '../../features/auth/presentation/pages/pages.dart';

List<GetPage<dynamic>> get getRoutes {
  const Duration transitionDuration = Duration(milliseconds: 350);
  return <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: '/login',
      page: Login.new,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
  ];
}
