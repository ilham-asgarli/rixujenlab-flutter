import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SvgHelper {
  Future<ByteData> precacheSvgPicture(
    String svgPath, {
    BuildContext? context,
  }) async {
    final asset = SvgAssetLoader(svgPath);
    return await svg.cache
        .putIfAbsent(asset.cacheKey(context), () => asset.loadBytes(context));
  }
}
