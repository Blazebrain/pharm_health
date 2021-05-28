import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants/constants.dart';
import 'extensions/string_extensions.dart';

ImageProvider makeNetworkAvatar(String url) {
  return url == null || !url.validateLink()
      ? const AssetImage(defaultAvatarAsset)
      : CachedNetworkImageProvider(url);
}

ImageProvider makeNetworkImage(String link) {
  return link == null || !link.validateLink()
      ? const CachedNetworkImageProvider(defaultNetworkImage)
      : CachedNetworkImageProvider(link);
}

ImageProvider makeCloudinaryThumbnail(String cloudinaryVideoLink) {
  if (cloudinaryVideoLink.startsWith('http:')) {
    cloudinaryVideoLink.replaceFirst('http', 'https');
  }
  final thumbnailLink =
      '${cloudinaryVideoLink.substring(cloudinaryVideoLink.length - 3)}png';

  return makeNetworkImage(thumbnailLink);
}

Future<void> openUrl(String url) async {
  if (url != null && url.validateLink()) {
    // final link = Uri.parse(url);
    final canOpen = await canLaunch(url);
    if (canOpen) await launch(url);
  }
}
