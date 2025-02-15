import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/generated/locale_keys.g.dart';
import '../view_models/app_view_model.dart';
import 'app_pages.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AppPages(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.branding_watermark_sharp),
            label: LocaleKeys.banner.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.screen_rotation_alt_outlined),
            label: LocaleKeys.interstitial.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.android),
            label: LocaleKeys.native.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.card_giftcard),
            label: LocaleKeys.rewarded.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: LocaleKeys.settings.tr(),
          ),
        ],
        currentIndex: context.watch<AppViewModel>().index,
        selectedFontSize: 10.sp,
        unselectedFontSize: 10.sp,
        iconSize: 20.sp,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    context.read<AppViewModel>().updateIndex(index);
  }
}
