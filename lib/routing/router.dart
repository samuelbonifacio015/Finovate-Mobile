import 'package:finovate_mobile/ui/core/layouts/base_layout.dart';
import 'package:finovate_mobile/ui/home/widgets/home_screen.dart';
import 'package:finovate_mobile/ui/screens/transaction/view_models/register_transaction.dart'
    as transaction_vm;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

// Funcion auxiliar para crear una página sin animación de transición
// Por defecto, GoRouter aplica una animación de desvanecimiento al navegar entre páginas.
//PD: GoRouter es una dependencia.
CustomTransitionPage<T> buildPageWithoutAnimation<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

// Configuracion del router utilizando GoRouter
GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) {
        return buildPageWithoutAnimation<void>(
          context: context,
          state: state,
          child: const BaseLayout(body: Home()),
        );
      },
    ),
    GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) {
        return buildPageWithoutAnimation<void>(
          context: context,
          state: state,
          child: const BaseLayout(body: Center(child: Text('Profile Screen'))),
        );
      },
    ),
    GoRoute(
      path: Routes.cropsArchive,
      pageBuilder: (context, state) {
        return buildPageWithoutAnimation<void>(
          context: context,
          state: state,
          child: const BaseLayout(
            body: Center(child: Text('Crops Archive Screen')),
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.transaction,
      pageBuilder: (context, state) {
        return buildPageWithoutAnimation<void>(
          context: context,
          state: state,
          child: const transaction_vm.RegisterTransactionScreen(),
        );
      },
    ),
  ],
);
