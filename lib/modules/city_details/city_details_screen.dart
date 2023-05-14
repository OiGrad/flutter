import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/helper/shimmer/card_shimmer.dart';
import 'package:kemet/modules/place_details/place_details_screen.dart';
import 'package:kemet/modules/widgets/home_screen_widgets.dart';
import 'package:kemet/modules/widgets/place_details.dart';

//TODO: use the real data.
String name = "محافظة القاهرة";
String shortDiscryption = "العاصمة";
String area = "34,140 كم";
String otherNames = "العاصمة المصرية";
String briefHistory =
    'بنيت القاهرة الحديثة قرب موقع مدينة ممفيس القديمة التي شيدت نحو عام 3100 ق. م، وكانت بذلك أول عاصمة لمصر القديمة. وعندما دخل العرب مصر عام 22 هـ، 642 م، أقامت وحدات الجيش العربي معسكر لها جنوبي الموقع الحالي للقاهرة حيث شيدوا بجواره بعد ذلك وبصورة متدرجة العديد من المساكن والمساجد، ويعد مسجد عمرو بن العاص أول وأكبر هذه المساجد، والقصور وهي النطاق العمراني الذي عرف بمدينة الفسطاط التي كانت أول عاصمة إسلامية لمصر. وعندما سيطر الفاطميون على مقاليد الحكم في مصر عام 359 هـ، 969 م بنى القائد جوهر الصقلي مدينة القاهرة ـ شمالي أول موقع استقر فيه العرب وهو الفسطاط ـ لتكون عاصمة للبلاد.ويعتقد إن القاهرة سميت بهذا الاسم نسبة إلى نجم القاهر الذي ظهر في السماء عندما بدء في بناء المدينة، وتلى ذلك تشييد الفاطميين للجامع الأزهر الشريف الذي أصبح أمل الراغبين في دراسة العلوم الإسلامية من كافة دول العالم الإسلامي.';

class CityView extends StatelessWidget {
  const CityView({super.key});

  @override
  Widget build(BuildContext context) {
    return detailedScreenDraft(
      context,
      title: name,
      headCardItem: Text(shortDiscryption),
      children: [
        headNote(context, text: AppStringsInArabic.generalInfo),
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
        headNote(context, text: AppStringsInArabic.briefHistory),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Text(
              briefHistory,
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
