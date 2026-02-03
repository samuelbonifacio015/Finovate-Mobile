import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:finovate_mobile/routing/routes.dart';
import 'package:finovate_mobile/ui/core/themes/app_sizes.dart';

class BaseLayout extends StatefulWidget {
  // Variable final para el cuerpo de la pantalla
  // Final quiere decir que su valor no puede cambiar despues de ser asignado
  final Widget body;

  const BaseLayout({super.key, required this.body});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  // Variable privada para el indice actual del BottomNavigationBar
  // Inicia en 1 porque la pantalla principal es la segunda opcion
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);

    final currentRoute = GoRouterState.of(context).location;

    if (currentRoute == Routes.profile) {
      _currentIndex = 0;
    } else if (currentRoute == Routes.home) {
      _currentIndex = 1;
    } else if (currentRoute == Routes.cropsArchive) {
      _currentIndex = 2;
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(child: widget.body),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _buildBottomNavigationBar(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.notifications, hasNotification: true),
          _buildNavItem(1, Icons.home),
          _buildNavItem(2, Icons.archive),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon, {
    bool hasNotification = false,
  }) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });

        if (index == 0) {
          context.go(Routes.profile);
        } else if (index == 1) {
          context.go(Routes.home);
        } else if (index == 2) {
          context.go(Routes.cropsArchive);
        }
      },
      child: Stack(
        children: [
          Icon(icon, color: isSelected ? Colors.blue : Colors.grey, size: 28),
          if (hasNotification)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
