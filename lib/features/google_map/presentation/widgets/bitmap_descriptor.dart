import 'package:google_maps_flutter/google_maps_flutter.dart';

BitmapDescriptor markerByPriority(String priority) {
  return priority == 'urgent'
      ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
      : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
}
