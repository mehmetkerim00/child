import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';

/// Слой карты OpenStreetMap.
///
/// Правила OSM (Tile Usage Policy) обязывают: кэшировать тайлы, слать
/// осмысленный User-Agent и показывать копирайт. Всё это здесь.
/// Если на пилоте карта станет нагруженной, поднимем свой тайл-сервер.
class OsmTileLayer extends StatelessWidget {
  const OsmTileLayer({super.key});

  /// Наш User-Agent: по нему OSM видит, кто ходит за тайлами.
  static const userAgent =
      'ChildApp/0.1 (Ashgabat child transport; '
      'https://github.com/mehmetkerim00/child)';

  static const urlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  @override
  Widget build(BuildContext context) {
    return TileLayer(
      urlTemplate: urlTemplate,
      userAgentPackageName: 'com.childapp.child.parent',
      // Кэш на диске: повторные тайлы не запрашиваются заново.
      tileProvider: _CachedTileProvider(),
      maxNativeZoom: 19,
    );
  }
}

/// Тайлы через дисковый кэш cached_network_image.
class _CachedTileProvider extends TileProvider {
  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    return CachedNetworkImageProvider(
      getTileUrl(coordinates, options),
      headers: const {'User-Agent': OsmTileLayer.userAgent},
    );
  }
}

/// Копирайт OSM — обязателен по условиям использования.
Widget osmAttribution() => const RichAttributionWidget(
  attributions: [TextSourceAttribution('© OpenStreetMap contributors')],
);
