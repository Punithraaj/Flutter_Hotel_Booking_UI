import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_hotel_booking_ui/constants/themes.dart';
import 'package:flutter_hotel_booking_ui/logic/controllers/google_map_pin_controller.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';

class GoogleMapUIView extends StatefulWidget {
  final List<HotelListData> hotelList;
  const GoogleMapUIView({Key? key, required this.hotelList}) : super(key: key);

  @override
  State<GoogleMapUIView> createState() => _GoogleMapUIViewState();
}

class _GoogleMapUIViewState extends State<GoogleMapUIView> {
  GoogleMapController? _mapController;
  late GoogleMapPinController _googleMapPinController;

  @override
  void initState() {
    _googleMapPinController = Get.find<GoogleMapPinController>();
    _googleMapPinController.updateHotelList(widget.hotelList);
    super.initState();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _googleMapPinController.updateScreenVisibleArea(
            Size(constraints.maxWidth, constraints.maxHeight));
        return GetBuilder<GoogleMapPinController>(builder: (provider) {
          return Stack(
            children: [
              Container(),
              GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(51.507896, -0.128006),
                  zoom: 13,
                ),
                mapType: MapType.normal,
                onCameraMove: (CameraPosition position) {
                  if (_mapController != null) {
                    _googleMapPinController
                        .updateGoogleMapController(_mapController!);
                  }
                },
                mapToolbarEnabled: false,
                compassEnabled: false,
                myLocationButtonEnabled: false,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) async {
                  _mapController = controller;
                  await _mapController?.setMapStyle(
                    await DefaultAssetBundle.of(context).loadString(
                      AppTheme.isLightMode
                          ? "assets/json/mapstyle_light.json"
                          : "assets/json/mapstyle_dark.json",
                    ),
                  );
                  _googleMapPinController.updateGoogleMapController(controller);
                },
              ),
              for (var item in provider.hotelList)
                item.screenMapPin != null
                    ? AnimatedPositioned(
                        duration: const Duration(milliseconds: 1),
                        top: item.screenMapPin!.dy - 48,
                        left: item.screenMapPin!.dx - 40,
                        child: SizedBox(
                          height: 48,
                          width: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: item.isSelected
                                      ? AppTheme.primaryColor
                                      : AppTheme.backgroundColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: AppTheme.secondaryTextColor,
                                      blurRadius: 16,
                                      offset: const Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      if (item.isSelected == false) {
                                        for (var f in provider.hotelList) {
                                          f.isSelected = false;
                                        }
                                        item.isSelected = true;
                                      }
                                      _googleMapPinController.updateUI();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 4, bottom: 4),
                                      child: Text(
                                        "\$${item.perNight}",
                                        style: TextStyle(
                                            color: item.isSelected
                                                ? AppTheme.backgroundColor
                                                : AppTheme.primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IgnorePointer(
                                child: Container(
                                  width: 1,
                                  color: item.isSelected
                                      ? AppTheme.primaryColor
                                      : AppTheme.backgroundColor,
                                  height: 13,
                                ),
                              ),
                              IgnorePointer(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  width: 4,
                                  height: 4,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(),
            ],
          );
        });
      },
    );
  }
}
