import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import go_router
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/services/navigation/routes.dart';

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const TopNavigationBar({
    super.key,
    required this.title,
    required this.showBackButton,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 1,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (context.canPop()) {
                  context.pop(); // Use context.pop() for back navigation
                }
              },
              color: cyan500,
            )
          : const SizedBox(),
      title: Text(title),
      centerTitle: true,
      foregroundColor: cyan_navbar_600,
      elevation: 0,
      backgroundColor: cyan100,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
          ),
        ),
        SizedBox(
          width: 50,
          child: DropdownSearch<(IconData, String, String)>(
            compareFn: (item1, item2) {
              return item1 == item2;
            },
            mode: Mode.custom,
            items: (f, cs) => [
              (CupertinoIcons.chart_pie, 'الاحصائيات', statisticsRoute),
              (TuskIcons.secretary, 'السكرتاريا', secretaryRoute),
              (Icons.person, 'الملف الشخصي', profileRoute),
              (
                Icons.settings,
                'الإعدادات',
                profileRoute
              ), // Consider a dedicated settings route
              (Icons.info_outline_rounded, 'حول', aboutRoute),
              (Icons.logout_rounded, 'تسجيل الخروج', roleRoute),
            ],
            onChanged: (value) {
              context.push(value!.$3); // Use context.go() for navigation
            },
            dropdownBuilder: (ctx, selectedItem) => Icon(
              Icons.menu,
              color: cyan_navbar_600,
            ),
            popupProps: PopupProps.menu(
              itemBuilder: (context, item, isDisabled, isSelected) {
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  leading: Icon(item.$1, color: Colors.white),
                  title: Text(
                    item.$2,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
              fit: FlexFit.loose,
              menuProps: const MenuProps(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              containerBuilder: (ctx, popupWidget) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
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
  }
}
