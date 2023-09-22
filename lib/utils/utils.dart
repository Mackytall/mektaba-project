import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:test/config/palette.dart';
import 'package:test/models/stock.dart';

String cleanupWhitespace(String input) {
  final whitespaceRE = RegExp(r"(?! )\s+| \s+");
  return input.replaceAll(whitespaceRE, " ");
}

Future<Coords> getGeoCoderData(address) async {
  List<Location> locations = await locationFromAddress(address);
  return Coords(locations.first.latitude, locations.first.longitude);
}

Future openMapsSheet(context, address, name) async {
  try {
    final coords = await getGeoCoderData(address);
    final title = name;
    final availableMaps = await MapLauncher.installedMaps;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  for (var map in availableMaps)
                    ListTile(
                      onTap: () => map.showMarker(
                        coords: coords,
                        title: title,
                      ),
                      title: Text(map.mapName),
                      leading: SvgPicture.asset(
                        map.icon,
                        height: 30.0,
                        width: 30.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  } catch (e) {
    print("Erreur lors de l'ouverture de l'application de cartes : $e");
  }
}

Text labelizeStockStatus(StockStatus status) {
  switch (status) {
    case StockStatus.available:
      return Text(
        "Disponible".toUpperCase(),
        style: const TextStyle(
          color: Palette.secondary,
        ),
      );
    case StockStatus.reserved:
      return Text(
        "Réservé".toUpperCase(),
        style: const TextStyle(
          color: Palette.quaternary,
        ),
      );

    case StockStatus.loan:
      return Text(
        "En prêt".toUpperCase(),
        style: const TextStyle(
          color: Color(0xFFD88513),
        ),
      );
    default:
      return Text("");
  }
}
