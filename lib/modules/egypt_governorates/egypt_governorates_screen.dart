import 'package:flutter/material.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/modules/widgets/home_screen_widgets.dart';

class EgyptGovernoratesScreen extends StatelessWidget {
  const EgyptGovernoratesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: AppColors.primary,),
        title:const Text(AppStringsInArabic.egyptGovernorates,style: TextStyle(fontSize: 18,fontFamily: 'Tajawal'),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 180,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, item) {
            return Container();
          },
        ),
      ),
    );
  }
}
