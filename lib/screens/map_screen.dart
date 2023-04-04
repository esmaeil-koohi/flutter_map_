import 'package:flutter/material.dart';
import 'package:flutter_map_proj/constant/dimens.dart';
import 'package:flutter_map_proj/constant/test_style.dart';
import 'package:flutter_map_proj/widget/my_back_button.dart';

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
  List currentWidgetList = [CurrentWidgetStates.stateSelectOrigin];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.blueGrey,
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
          onPressed: () {
            setState(() {
              currentWidgetList.add(CurrentWidgetStates.stateSelectDestination);
            });
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
