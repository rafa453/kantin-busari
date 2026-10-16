import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? semanticLabel;

  const AppImage(this.url, {super.key, this.width, this.height, this.fit = BoxFit.cover, this.semanticLabel});

  @override
  Widget build(BuildContext context) {
    final c = context.palette;
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final cw = (width != null && width!.isFinite) ? (width! * dpr).round() : null;
    final ch = (height != null && height!.isFinite) ? (height! * dpr).round() : null;
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: cw,
      cacheHeight: ch,
      semanticLabel: semanticLabel,
      loadingBuilder: (ctx, child, progress) => progress == null
          ? child
          : Container(width: width, height: height, color: c.surfaceContainer),
      frameBuilder: (ctx, child, frame, sync) => sync
          ? child
          : AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 250),
              child: child,
            ),
      errorBuilder: (_, __, ___) => Container(
        width: width,
        height: height,
        color: c.surfaceContainer,
        alignment: Alignment.center,
        child: Icon(Icons.restaurant, color: c.onVariant, size: (width != null && width! < 40) ? 14 : 20),
      ),
    );
  }
}