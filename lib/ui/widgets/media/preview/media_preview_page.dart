import 'package:flutter/material.dart';
import 'package:skybase/core/helper/media_helper.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_image.dart';
import 'package:skybase/ui/widgets/sky_video.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class MediaPreviewPage extends StatelessWidget {
  final String url;
  final bool fromFile;
  final String? title;
  final TextStyle? titleStyle;

  const MediaPreviewPage({
    Key? key,
    required this.url,
    this.fromFile = true,
    this.title,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SkyAppBar.primary(
          title: title ?? 'Media Preview',
          titleStyle: titleStyle,
        ),
        body: _determineMedia(url));
  }

  Widget _determineMedia(String path) {
    final mediaType = MediaHelper.getMediaType(path);
    switch (mediaType.type) {
      case MediaType.file:
        return const Center(child: Text('Media Unsupported'));
      case MediaType.image:
        return Center(
          child: SkyImage(
            src: mediaType.path,
            fromFile: fromFile,
          ),
        );
      case MediaType.video:
        return SkyVideo(
          url: mediaType.path,
          height: double.infinity,
          width: double.infinity,
        );
      case MediaType.unknown:
        return const Center(child: Text('Media Unsupported'));
    }
  }
}
