import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapProvider extends ChangeNotifier {
  LatLngBounds? _visibleRegion;
  Size? _visibleScreenSize;
  GoogleMapController? _mapController;
  List<HotelListData> _hotelList = [];

  List<HotelListData> get hotelList => _hotelList;

  void updateGoogleMapController(GoogleMapController mapController) async {
    _mapController = mapController;
    await _setPositionOnScreen();
    notifyListeners();
  }

  void updateScreenVisibleArea(Size size) {
    _visibleScreenSize = size;
    notifyListeners();
  }

  void updateHotelList(List<HotelListData> _list) {
    _hotelList = _list;
    notifyListeners();
  }

  void updateUI() {
    notifyListeners();
  }

  Future _setPositionOnScreen() async {
    if (_mapController != null && _visibleScreenSize != null) {
      _visibleRegion = await _mapController?.getVisibleRegion();
      if (_visibleRegion != null) {
        var sSize = _visibleScreenSize;
        var sdl = _visibleRegion!.northeast.latitude -
            _visibleRegion!.southwest.latitude;
        var sdlg = _visibleRegion!.southwest.longitude -
            _visibleRegion!.northeast.longitude;
        if (_mapController != null) {
          for (var item in _hotelList) {
            if (item.location != null) {
              var fdl =
                  _visibleRegion!.northeast.latitude - item.location!.latitude;
              var fdlg = _visibleRegion!.southwest.longitude -
                  item.location!.longitude;
              item.screenMapPin = Offset(
                  (fdlg * sSize!.width) / sdlg, (fdl * sSize.height) / sdl);
            }
          }
        }
      }
    }
  }
}
