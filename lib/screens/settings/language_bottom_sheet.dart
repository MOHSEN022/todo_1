import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            child: Container(color: Colors.blue,height: 40,),
            onTap: (){
              // settingsProvider.changeLocal('en');
            },

            // child: settingsProvider.currentLanguage== 'en'?
            // getSellectedItem('English'):getUnsellectedItem('English'),
          ),
          SizedBox(height: 50,),
          InkWell(
            child: Container(color: Colors.blue,height: 40,),
            onTap: (){
              // settingsProvider.changeLocal('ar');
            },
            // child: settingsProvider.currentLanguage== 'ar'?
            // getSellectedItem('العربية'):getUnsellectedItem('العربية'),
          )

        ],
      ),
    );
  }

  Widget getSellectedItem(String title) {
    // var settingsProvider = Provider.of<SettingsProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Theme.of(context).dividerColor),
        ),
        Icon(Icons.check,color: Theme.of(context).dividerColor,),
      ],
    );
  }

  Widget getUnsellectedItem(String title) {
    // var settingsProvider = Provider.of<SettingsProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            title,
            style: Theme.of(context).textTheme.subtitle2
        ),
      ],
    );
  }
}
