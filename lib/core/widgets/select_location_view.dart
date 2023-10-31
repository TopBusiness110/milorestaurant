import 'dart:collection';


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:milorestaurant/core/utils/getsize.dart';

import '../utils/assets_manager.dart';

class SelectLocationView extends StatefulWidget {
  final bool fromView;
  final GoogleMapController? mapController;
  const SelectLocationView({Key? key, required this.fromView, this.mapController}) : super(key: key);

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  late CameraPosition _cameraPosition;
  final Set<Polygon> _polygons = HashSet<Polygon>();
  GoogleMapController? _mapController;
  GoogleMapController? _screenMapController;

  @override
  void initState() {
    super.initState();
    // if(Get.find<AuthController>().zoneList != null) {
    //   Get.find<AuthController>().getZoneList();
    // }
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(child: Padding(
      padding: EdgeInsets.all(widget.fromView ? 0 : getSize(context)/30),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

           SizedBox(height:  getSize(context)/30),

          mapView(),


        ]),
      ),
    ));
  }


  Widget mapView() {
    return
    Container(
      height: widget.fromView ? 125 : (context.height * 0.55),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getSize(context)/30),
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getSize(context)/22),
        child: Stack(clipBehavior: Clip.none, children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                double.parse( '26.9060999'),
                double.parse( '30.8768375'),
              ), zoom: 16,
            ),
            minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
            zoomControlsEnabled: false,
            compassEnabled: false,
            indoorViewEnabled: true,
            mapToolbarEnabled: false,
            myLocationEnabled: false,
            zoomGesturesEnabled: true,
            polygons: _polygons,
            onCameraIdle: () {
              // authController.setLocation(_cameraPosition.target);
              // if(!widget.fromView) {
              //   widget.mapController!.moveCamera(CameraUpdate.newCameraPosition(_cameraPosition));
              // }
            },
            onCameraMove: ((position) => _cameraPosition = position),
            onMapCreated: (GoogleMapController controller) {
              // authController.setLocation(LatLng(
              //   double.parse(Get.find<SplashController>().configModel!.defaultLocation!.lat ?? '0'),
              //   double.parse(Get.find<SplashController>().configModel!.defaultLocation!.lng ?? '0'),
              // ));
              // if(widget.fromView) {
              //   _mapController = controller;
              // }else {
              //   _screenMapController = controller;
              // }
            },
          ),
          Center(child: Image.asset(ImageAssets.pickMarker, height: 50, width: 50)),


        ]),
      ),
    ) ;
  }
}
