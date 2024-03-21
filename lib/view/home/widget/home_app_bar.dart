import 'package:api_retrofit_project/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onLogoutButtonPressed;

  const HomeAppBar({required this.onLogoutButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _homeTitle(),
      actions: [
        _logoutIconButton(),
      ],
    );
  }
//! widget method
  Widget _homeTitle() => Text(AppStrings.labelString.kHome);

  Widget _logoutIconButton() => IconButton(
        onPressed: onLogoutButtonPressed,
        icon: const Icon(Icons.logout_rounded),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
