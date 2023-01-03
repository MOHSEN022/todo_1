import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatefulWidget {

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
            onTap: () {
              // settingsProvider.changeTheme(ThemeMode.light);
            },
            // child: settingsProvider.isDarkMode()
            //     ? getUnsellectedItem(AppLocalizations.of(context)!.light_theme)
            //     : getSellectedItem(AppLocalizations.of(context)!.light_theme)

          ),
          SizedBox(height: 50,),
          InkWell(
            child: Container(color: Colors.blue,height: 40,),
            onTap: () {
              // settingsProvider.changeTheme(ThemeMode.dark);
            },
            // child: settingsProvider.isDarkMode()
            //     ? getSellectedItem(AppLocalizations.of(context)!.dark_theme)
            //     : getUnsellectedItem(AppLocalizations.of(context)!.dark_theme)
            // ,
          )

        ],
      ),
    );
  }

  getSellectedItem(String title) {
    // var settingsProvider = Provider.of<SettingsProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          // style: Theme.of(context).textTheme.subtitle2?.
          // copyWith(color:Theme.of(context).dividerColor),
        ),
        Icon(Icons.check, color: Theme.of(context).dividerColor,),
      ],
    );
  }

  getUnsellectedItem(String title) {
    // var settingsProvider = Provider.of<SettingsProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            title,
            style:Theme.of(context).textTheme.subtitle2
        ),

      ],
    );
  }
}
