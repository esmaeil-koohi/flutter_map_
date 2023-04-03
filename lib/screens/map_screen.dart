import 'package:flutter/material.dart';
import 'package:flutter_map_proj/constant/dimens.dart';
import 'package:flutter_map_proj/constant/test_style.dart';
import 'package:flutter_map_proj/widget/my_back_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
               
             },),
            Positioned(
                bottom: Dimens.large,
                left: Dimens.large,
                right: Dimens.large,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('انتخاب مبدا', style: MyTextStyle.button,),
                )),
          ],
        ),
      ),
    );
  }
}


