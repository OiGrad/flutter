import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/core/navigation.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/modules/directions/place_directions/place_directions_screen.dart';
import 'package:kemet/modules/widgets/widgets.dart';

import '../widgets/place_details.dart';

//TODO: use the real data.
String title = "الكنيسة المعلقة";
double placeRating = 5;
double userRating = 0;
String shortDiscryption = "short discryption";
String fees = "Free";
String briefHistory =
    'brief history, lorem ipsum loremipsum lorem ipsum lorem ipsum loremipsum ';
String location = "Location";
String NMS = "Nearest Metro Station";
List<String> imags = [
  'assets/images/placeImage.jpg',
  'assets/images/placeImage.jpg',
  'assets/images/placeImage.jpg'
];

class PlaceView extends StatelessWidget {
  const PlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: detailedScreenDraft(
        context,
        title: title,
        headCardItem: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
              child: RatingBar.builder(
                initialRating: placeRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Text("${placeRating.toString()}/5"),
          ],
        ),
        children: [
          const SizedBox(),
          headNote(
            context,
            text: AppStringsInEnglish.generalInfo,
            icon: Icons.content_paste,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //TODO:add the correct icons
                Icon(Icons.pause_circle),
                Text(fees),

                Icon(Icons.pause_circle),
                Text(shortDiscryption),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  AppStringsInEnglish.rate,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: RatingBar.builder(
              initialRating: userRating,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 30,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          defaultButton(
            r: 5,
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            text: AppStringsInEnglish.save,
            color: const Color.fromARGB(255, 228, 164, 37),
            function: () {},
            context: context,
          ),
          const SizedBox(),
          headNote(context, text: AppStringsInEnglish.briefHistory),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
            child: Text(
              briefHistory,
            ),
          ),
          headNote(context, text: AppStringsInEnglish.location),
          Text(location),
          Text(NMS),
          const SizedBox(height: 5),
          defaultButton(
            r: 5,
            height: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            text: AppStringsInEnglish.directions,
            color: const Color.fromARGB(255, 228, 164, 37),
            function: () {
              navigateTo(context,
                  PlaceDirections(title: title, placeRating: placeRating));
            },
            context: context,
          ),

          const SizedBox(),

          headNote(context, text: AppStringsInEnglish.gallery),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
            child: SizedBox(
              height: 160,
              child: ListView.builder(
                itemCount: imags.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(15)),
                        border: Border.all(color: AppColors.orange),
                      ),
                      child: Image.asset(
                        imags[index],
                        width: 120,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          /*Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imags.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imags[index],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),*/

          headNote(context, text: AppStringsInEnglish.reviews)
          //TODO: add the post component.
        ],
      ),
    );
  }
}
