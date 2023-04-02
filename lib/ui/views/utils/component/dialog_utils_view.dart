import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/core/helper/dialog_helper.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_button.dart';

class DialogUtilsView extends StatelessWidget {
  const DialogUtilsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SkyAppBar.primary(title: 'Dialog Utility'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Sample Dialog Usage'),
            const SizedBox(height: 12),
            SkyButton(
              text: 'Loading',
              icon: CupertinoIcons.arrow_2_circlepath,
              onPressed: () {
                LoadingDialog.show(dismissible: true);
              },
            ),
            const SizedBox(height: 12),
            SkyButton(
              text: 'txt_warning'.tr,
              icon: Icons.warning_amber,
              outlineMode: true,
              color: Colors.orange,
              onPressed: () {
                SkyDialog.warning(
                  message: 'Some Description Text',
                  onConfirm: () => SkyDialog.dismiss(),
                );
              },
            ),
            const SizedBox(height: 12),
            SkyButton(
              text: 'txt_failed'.tr,
              icon: Icons.close,
              outlineMode: true,
              color: Colors.red,
              onPressed: () {
                SkyDialog.failed(
                  message: 'Some Description Text',
                  onConfirm: () => SkyDialog.dismiss(),
                );
              },
            ),
            const SizedBox(height: 12),
            SkyButton(
              text: 'txt_success'.tr,
              icon: CupertinoIcons.checkmark_alt_circle,
              outlineMode: true,
              color: Colors.green,
              onPressed: () {
                SkyDialog.success(
                  message: 'Some Description Text',
                  onConfirm: () => SkyDialog.dismiss(),
                );
              },
            ),
            const SizedBox(height: 12),
            SkyButton(
              text: 'Retry',
              icon: CupertinoIcons.refresh_thick,
              onPressed: () {
                SkyDialog.retry(
                  message: 'Some Description Text',
                  onConfirm: () => SkyDialog.dismiss(),
                );
              },
            ),
            const SizedBox(height: 12),
            SkyButton(
              text: 'Force',
              icon: CupertinoIcons.exclamationmark_shield,
              onPressed: () {
                SkyDialog.force(
                  message: 'Some Description Text',
                  onConfirm: () => SkyDialog.dismiss(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
