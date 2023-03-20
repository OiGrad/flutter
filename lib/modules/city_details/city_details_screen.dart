import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/modules/place_details/place_details_screen.dart';
import 'package:kemet/modules/widgets/home_screen_widgets.dart';
import 'package:kemet/modules/widgets/place_details.dart';

//TODO: use the real data.
String name = "محافظة القاهرة";
String shortDiscryption = "العاصمة";
String area = "34,140 كم";
String otherNames = "العاصمة المصرية";
String briefHistory =
    'brief history, lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum ';

class CityView extends StatelessWidget {
  const CityView({super.key});

  @override
  Widget build(BuildContext context) {
    return detailedScreenDraft(
      context,
      title: name,
      headCardItem: Text(shortDiscryption),
      children: [
        headNote(context, text: AppStringsInEnglish.generalInfo),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("AKA : $otherNames"),
              Text("Name : $name"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Area : $area"),
            ],
          ),
        ),
        headNote(context, text: AppStringsInEnglish.briefHistory),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Text(briefHistory),
        ),
        headNote(context, text: AppStringsInEnglish.famousPlaces),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
          child: SizedBox(
            height: MediaQueryValues(context).height * 0.26,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  child: cardOfPlace(context),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
