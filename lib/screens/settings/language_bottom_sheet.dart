import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/setting_provider.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              settingsProvider.changeLocale('en');
            },
            child: settingsProvider.currentLanguage == 'en'
                ? getSellectedItem(AppLocalizations.of(context)!.english)
                : getUnsellectedItem(AppLocalizations.of(context)!.english),
          ),
          SizedBox(height: 50,),
          InkWell(
            onTap: (){
              settingsProvider.changeLocale('ar');
            },
            child: settingsProvider.currentLanguage == 'ar'
                ? getSellectedItem(AppLocalizations.of(context)!.arabic)
                : getUnsellectedItem(AppLocalizations.of(context)!.arabic),
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
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Theme.of(context).dividerColor),
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
