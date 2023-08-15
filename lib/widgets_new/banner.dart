import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/colors.dart';
import '../constants/font.dart';
import '../constants/spacing.dart';
import '../constants/icons.dart';

enum BannerType { info, alert, danger, neutral, success }

class OntegoBanner {
  static late FToast fBannerGlobal = FToast();
  static void closeBanner() {
    fBannerGlobal.removeCustomToast();
  }

  static bool closeBannerCallback() {
    closeBanner();
    return true;
  }

  static void showBanner(FToast fBanner,
      {type = BannerType.info,
      // String errorText = '',
      bool isBottom = true,
      IconData iconData = AppIcons.bookmark,
      successMessage = 'INPUT SUCCESS'}) {
    fBannerGlobal = fBanner;
    Color color = AppColors.P40;
    Color textColor = AppColors.N00;
    if (type == BannerType.info) {
      color = AppColors.P40;
      textColor = AppColors.N00;
    } else if (type == BannerType.alert) {
      color = AppColors.A50;
      textColor = AppColors.N90;
    } else if (type == BannerType.danger) {
      color = AppColors.D40;
      textColor = AppColors.N00;
    } else if (type == BannerType.neutral) {
      color = AppColors.N20;
      textColor = AppColors.N90;
    } else if (type == BannerType.success) {
      color = AppColors.S50;
      textColor = AppColors.N00;
    }
    // Color color = !isError
    //     ? const Color.fromRGBO(0, 156, 129, 1)
    //     : const Color.fromARGB(255, 224, 51, 38);
    // if (isWarn) {
    //   color = const Color.fromARGB(255, 255, 210, 52);
    // }

    Icon icon = Icon(
      iconData,
      // color: Colors.white,
    );

    // Icon icon = !isError
    //     ? const Icon(
    //         Icons.check,
    //         color: Colors.white,
    //       )
    //     : const Icon(
    //         Icons.error,
    //         color: Colors.white,
    //       );
    // if (isError) {
    //   icon = const Icon(
    //     Icons.error,
    //     color: Colors.white,
    //   );
    // }

    // if (isWarn) {
    //   icon = const Icon(
    //     Icons.warning,
    //     color: Colors.white,
    //   );
    // }

    Widget Banner = GestureDetector(
      onTap: () => fBanner.removeCustomToast(),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space4, vertical: AppSpacing.space6),
        decoration: BoxDecoration(
          color: color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(
              // width: 12.0,
              width: AppSpacing.space2,
            ),
            Flexible(
              child: Text(successMessage,
                  style: AppFont.smallMedium(textColor: textColor)
                  // TextStyle(color: textColor),
                  ),
            ),
            // isError == false
            //     ? Flexible(
            //         child: Text(
            //           successMessage,
            //           style: const TextStyle(color: Colors.white),
            //         ),
            //       )
            //     : Flexible(
            //         child: Text(
            //           errorText,
            //           style: const TextStyle(color: Colors.white),
            //         ),
            //       )
          ],
        ),
      ),
    );
    fBanner.removeCustomToast();
    fBanner.showToast(
      child: Banner,
      gravity: isBottom ? ToastGravity.BOTTOM : ToastGravity.TOP,
      toastDuration: const Duration(seconds: 5),
    );
  }
}
