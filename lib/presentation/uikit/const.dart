import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// Константы

const double drawerSizeText = 22;
const LatLng museumLocation = LatLng(55.741469, 37.620561);
final MapController mapController = MapController();
bool isMapLoaded = false;
const double marginBottomSocial = 30;
const double sizeTitleH1 = 24;

var textPromo = 'Музей Nexus работает каждую пятницу и открыт бесплатно. Присоединяйтесь к нам вечером!';
const double sizeTextPromo = 10;
