import 'package:flutter/material.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/data/place.dart';
import 'package:kemet/modules/widgets/widgets.dart';
import 'package:dotted_border/dotted_border.dart';

Widget postPlaceCard(BuildContext context, place, text) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          width: MediaQueryValues(context).width - 40,
          child: Column(
            children: [
              PlaceInContext(context, place.name, place.image),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget post(BuildContext context, Place place, text) {
  return Container(
    width: double.infinity,
    child: Column(
      children: [
        postHeader(place.image, 'userName', 'postedAt'),
        postPlaceCard(context, place, text)
      ],
    ),
  );
}

Widget postHeader(String userImage, String userName, String postedAt) {
  String postedSince = '0 mins ago';
  //TODO: process postedAt to get postedSince
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          userImage,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userName),
              //TODO: build the expanded icon button for 'the list of post actions'
            ],
          ),
          Text(
            postedSince,
            style: const TextStyle(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF95A1AC),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      )
    ],
  );
}
