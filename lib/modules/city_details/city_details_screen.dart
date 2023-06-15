import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/helper/shimmer/card_shimmer.dart';
import 'package:kemet/models/city.dart';
import 'package:kemet/modules/place_details/place_details_screen.dart';
import 'package:kemet/modules/widgets/home_screen_widgets.dart';
import 'package:kemet/modules/widgets/place_details.dart';

import '../../helper/end_points.dart';

class CityView extends StatelessWidget {
  final City city;
  const CityView({required this.city, super.key});

  @override
  Widget build(BuildContext context) {
    return detailedScreenDraft(
      context,
      title: city.name,
      imageLink: '${AppEndPoints.baseUrl}${city.main_Image}',
      headCardItem: Text(city.nick_name),
      children: [
        headNote(context, text: AppStringsInArabic.generalInfo),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("AKA : ${city.nick_name}"),
              Text("Name : ${city.name}"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Area : ${city.area}"),
            ],
          ),
        ),
        headNote(context, text: AppStringsInArabic.briefHistory),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Text(
            city.info,
            textAlign: TextAlign.end,
          ),
        ),
        headNote(context, text: AppStringsInArabic.famousPlaces),
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
                  child: CardShimmer(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
