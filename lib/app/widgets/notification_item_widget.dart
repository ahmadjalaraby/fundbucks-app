import 'package:app/app/modules/theme_controller.dart';
import 'package:app/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class NotificationItemWidget extends StatelessWidget {
  final String title;
  final String time;
  final String description;
  final bool isRead;
  final VoidCallback onTap;
  final VoidCallback onDeleteTap;
  const NotificationItemWidget({
    Key? key,
    required this.title,
    required this.time,
    required this.description,
    this.isRead = false,
    required this.onTap,
    required this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        color: isRead
            ? (ThemeController.to.getIsDarkMode
                ? greyColor.withOpacity(.57)
                : softGreyColor.withOpacity(.2))
            : (ThemeController.to.getIsDarkMode
                ? containerColorDarkTheme
                : containerColorLightTheme),
        margin: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ThemeController.to.getIsDarkMode
                                    ? containerColorLightTheme
                                    : chartTitleColor,
                                //fontFamily: FontFamily.inter,
                                fontSize: 14.sp,
                              )),
                          SizedBox(height: 4.h),
                          Text(time,
                              style: TextStyle(
                                color: ThemeController.to.getIsDarkMode
                                    ? unselectedBottomBarItemColorDarkTheme
                                    : Colors.grey[400],
                                fontSize: 11.sp,
                                //fontFamily: FontFamily.inter,
                              )),
                          SizedBox(height: 8.h),
                          Text(description,
                              style: TextStyle(
                                color: ThemeController.to.getIsDarkMode
                                    ? unselectedBottomBarItemColorDarkTheme
                                    : unselectedBottomBarItemColorLightTheme,
                                //fontFamily: FontFamily.inter,
                                fontSize: 14.sp,
                              )),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: onTap,
                      icon: Iconify(
                        Mdi.eye,
                        color: isRead
                            ? (ThemeController.to.getIsDarkMode
                                ? bottomBarItemColorDarkTheme
                                : mainColor)
                            : (ThemeController.to.getIsDarkMode
                                ? unselectedBottomBarItemColorDarkTheme
                                : unselectedBottomBarItemColorLightTheme),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    IconButton(
                      onPressed: onDeleteTap,
                      icon: Iconify(
                        Mdi.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )),
            Divider(
              height: 1.h,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
