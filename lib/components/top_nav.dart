import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/locator.dart';
import 'package:tlbisibida_doc/services/navigation/navigation_service.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final navigationService = locator<NavigationService>();

    return ValueListenableBuilder(
      valueListenable: navigationService.currentTitle,
      builder: (context, title, _) {
        return ValueListenableBuilder(
          valueListenable: navigationService.showBackButton,
          builder: (context, showBack, _) {
            return AppBar(
              scrolledUnderElevation: 1,
              leading: showBack
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => navigationService.goBack(),
                      color: cyan500,
                    )
                  : SizedBox(),
              title: Text(
                title,
                style: TextStyle(color: cyan_navbar_600),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: cyan_navbar_600),
              elevation: 0,
              backgroundColor: cyan100,
              actions: [
                // IconButton(
                //   onPressed: () => navigationService.navigateTo(homePageRoute),
                //   icon: const Icon(Icons.home_rounded),
                // ),
                // IconButton(
                //   onPressed: () => navigationService.navigateTo(profileRoute),
                //   icon: const Icon(Icons.person),
                // ),
                // IconButton(
                //   onPressed: () {},
                //   //navigationService.navigateTo(clientPageRoute),
                //   icon: const Icon(Icons.people),
                // ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                  ),
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.menu_rounded,
                //     ))
                SizedBox(
                  width: 50,
                  child: DropdownSearch<(IconData, String, String)>(
                    mode: Mode.custom,
                    // selectedItem: (Icons.menu, ''),
                    compareFn: (item1, item2) => item1.$1 == item2.$2,
                    items: (f, cs) => [
                      (CupertinoIcons.chart_pie, 'الاحصائيات', statisticsRoute),
                      (TuskIcons.secretary, 'السكرتاريا', secretaryRoute),
                      (Icons.person, 'الملف الشخصي', profileRoute),
                      (Icons.settings, 'الإعدادات', profileRoute),
                      (Icons.info_outline_rounded, 'حول', aboutRoute),
                      (
                        Icons.logout_rounded,
                        'تسجيل الخروج',
                        authenticationPageRoute
                      ),
                    ],
                    onChanged: (value) {
                      locator<NavigationService>().navigateTo(value!.$3);
                    },
                    // decoratorProps: DropDownDecoratorProps(
                    //   decoration: InputDecoration(
                    //     contentPadding: EdgeInsets.symmetric(vertical: 6),
                    //     //filled: true,
                    //     //fillColor: Color(0xFF1eb98f),
                    //     border: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.transparent),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.transparent),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.transparent),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    // ),
                    dropdownBuilder: (ctx, selectedItem) => Icon(
                      Icons.menu,
                      color: cyan_navbar_600,
                    ),
                    popupProps: PopupProps.menu(
                      itemBuilder: (context, item, isDisabled, isSelected) {
                        return ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          leading: Icon(item.$1, color: Colors.white),
                          title: Text(
                            item.$2,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      fit: FlexFit.loose,
                      menuProps: MenuProps(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        //margin: EdgeInsets.only(top: 16),
                      ),
                      containerBuilder: (ctx, popupWidget) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Image.asset(
                                'assets/icons/arrow-up.png',
                                color: cyan400,
                                height: 14,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: cyan400,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: popupWidget,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
