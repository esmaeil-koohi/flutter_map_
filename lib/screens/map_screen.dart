import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map_proj/constant/dimens.dart';
import 'package:flutter_map_proj/constant/test_style.dart';
import 'package:flutter_map_proj/widget/my_back_button.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentWidgetStates {
  CurrentWidgetStates._();

  static const stateSelectOrigin = 0;
  static const stateSelectDestination = 1;
  static const stateRequestDriver = 2;
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<GeoPoint> geoPoints = [];
  List currentWidgetList = [CurrentWidgetStates.stateSelectOrigin];
  Widget markerIcon = SvgPicture.asset('assets/icons/origin.svg', height: 100, width: 40,);
  MapController mapController = MapController(
    initMapWithUserPosition: false,
    initPosition: GeoPoint(latitude: 35.7367516373 , longitude: 51.2911096718 ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: OSMFlutter(
                controller: mapController,
                trackMyPosition: false,
                initZoom: 15,
                isPicker: true,
                mapIsLoading: const SpinKitCircle(color: Colors.black,),
                minZoomLevel: 8,
                maxZoomLevel: 18,
                stepZoom: 1,
                markerOption: MarkerOption(advancedPickerMarker: MarkerIcon(iconWidget: markerIcon,)),
              ),
            ),
            MyBackButton(
              onPressed: () {
                if(currentWidgetList.length > 1){
                  setState(() {
                   currentWidgetList.removeLast();
                  });
                }
              },
            ),
            currentWidget(),
          ],
        ),
      ),
    );
  }

  Widget currentWidget(){
    Widget widget = origin();

    switch(currentWidgetList.last){
      case CurrentWidgetStates.stateSelectOrigin:
        widget = origin();
        break;
      case CurrentWidgetStates.stateSelectDestination:
        widget = dest();
        break;
      case CurrentWidgetStates.stateRequestDriver:
        widget = reqDriven();
        break;
    }
    return widget;
  }

  Widget origin() {
    return Positioned(
        bottom: Dimens.large,
        left: Dimens.large,
        right: Dimens.large,
        child: ElevatedButton(
          onPressed: () async {
            GeoPoint originGeoPoint = await mapController.getCurrentPositionAdvancedPositionPicker();
            log(originGeoPoint.latitude.toString());
            geoPoints.add(originGeoPoint);
            markerIcon = SvgPicture.asset('assets/icons/destination.svg', height: 100, width: 48,);
            setState(() {
              currentWidgetList.add(CurrentWidgetStates.stateSelectDestination);
            });
            mapController.init();
          },
          child: Text(
            'انتخاب مبدا',
            style: MyTextStyle.button,
          ),
        ));
  }

  Widget dest() {
    return Positioned(
        bottom: Dimens.large,
        left: Dimens.large,
        right: Dimens.large,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              currentWidgetList.add(CurrentWidgetStates.stateRequestDriver);
            });
          },
          child: Text(
            'انتخاب مقصد',
            style: MyTextStyle.button,
          ),
        ));
  }

  Widget reqDriven() {
    return Positioned(
        bottom: Dimens.large,
        left: Dimens.large,
        right: Dimens.large,
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text(
            'درخواست راننده',
            style: MyTextStyle.button,
          ),
        ));
  }

}
