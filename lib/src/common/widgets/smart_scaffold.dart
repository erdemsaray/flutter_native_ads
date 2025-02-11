import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/navigation/navigation_constants.dart';
import '../../core/services/connectivity/connectivity_handler.dart';
import '../../core/services/navigation/navigation_service.dart';
import 'disconnect_widget.dart';
import 'observable.dart';

class SmartScaffold extends StatelessWidget {
  final Widget? title;
  final PreferredSizeWidget? appBar;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? body;
  final bool isLeadingActive;
  final bool isDetailPage;
  final FloatingActionButton? floatingActionButton;
  final bool removeDefaultPadding;
  final Color? scaffoldBackgroundColor;
  final bool appBarVisibility;
  final bool removeDefaultSafeArea;

  const SmartScaffold({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.body,
    this.appBarVisibility = true,
    this.isLeadingActive = true,
    this.isDetailPage = false,
    this.floatingActionButton,
    this.removeDefaultPadding = false,
    this.appBar,
    this.scaffoldBackgroundColor,
    this.removeDefaultSafeArea = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Observable(
          observable: ConnectivityHandler.isConnectedValueNotifier,
          builder: (_, final bool isConnected) => isConnected
              ? Scaffold(
                  backgroundColor: scaffoldBackgroundColor,
                  extendBodyBehindAppBar: false,
                  resizeToAvoidBottomInset: true,
                  floatingActionButton: floatingActionButton,
                  appBar: !appBarVisibility
                      ? null
                      : appBar ??
                          AppBar(
                            surfaceTintColor: Colors.transparent, // AppBar background changing remove
                            title: title,
                            toolbarHeight: 51.52.h,
                            leading: !isLeadingActive
                                ? null
                                : leading == null && Navigator.canPop(context)
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.arrow_back_ios,
                                        ),
                                        onPressed: () {
                                          try {
                                            Navigator.canPop(context)
                                                ? Navigator.pop(context)
                                                : NavigationService.instance.navigateToPageClear(path: NavigationConstants.root);
                                          } catch (e) {
                                            NavigationService.instance.navigateToPageClear(path: NavigationConstants.root);
                                          }
                                        },
                                      )
                                    : leading,
                            actions: actions,
                            centerTitle: true,
                            titleTextStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                            ),
                          ),
                  body: SizedBox(
                    height: 1.sh,
                    width: 1.sw,
                    child: Padding(
                        padding: removeDefaultPadding
                            ? EdgeInsets.zero
                            : EdgeInsets.symmetric(
                                horizontal: 17.w,
                                vertical: 18.h,
                              ),
                        child: body ?? const SizedBox()),
                  ),
                )
              : const DisconnectedWidget());
    });
  }
}
