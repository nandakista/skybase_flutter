import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/ui/widgets/sky_button.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    this.errorImage,
    this.errorImageWidget,
    this.errorTitle,
    this.errorSubtitle,
    this.onRetry,
    this.retryText,
    this.verticalSpacing = 24,
    this.horizontalSpacing = 24,
    this.imageSize,
    this.titleStyle,
    this.subtitleStyle,
    this.retryWidget,
    this.physics,
  }) : super(key: key);

  final String? errorImage;
  final Widget? errorImageWidget;
  final String? errorTitle;
  final String? errorSubtitle;
  final String? retryText;
  final VoidCallback? onRetry;
  final double verticalSpacing;
  final double horizontalSpacing;
  final double? imageSize;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget? retryWidget;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: physics,
        padding: EdgeInsets.symmetric(
          vertical: verticalSpacing,
          horizontal: horizontalSpacing,
        ),
        child: Column(
          children: [
            errorImageWidget ??
                Image.asset(
                  errorImage ?? 'assets/images/img_error.png',
                  height: imageSize,
                ),
            SizedBox(height: verticalSpacing * 2),
            Text(
              errorTitle ?? 'txt_err_general_formal'.tr,
              textAlign: TextAlign.center,
              style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              errorSubtitle ?? 'txt_tap_retry'.tr,
              textAlign: TextAlign.center,
              style: subtitleStyle,
            ),
            SizedBox(height: verticalSpacing),
            retryWidget ??
                SkyButton(
                  wrapContent: true,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  text: retryText ?? 'txt_retry'.tr,
                  onPressed: onRetry,
                ),
          ],
        ),
      ),
    );
  }
}