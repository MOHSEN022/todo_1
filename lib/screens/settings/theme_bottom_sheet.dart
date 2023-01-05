import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/setting_provider.dart';

class ThemeBottomSheet extends StatefulWidget {

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              settingsProvider.changeTheme(ThemeMode.light);
            },
            child: settingsProvider.isDarkMode()
                ? getUnsellectedItem(AppLocalizations.of(context)!.light)
                : getSellectedItem(AppLocalizations.of(context)!.light)

          ),
          const SizedBox(height: 50,),
          InkWell(
            onTap: () {
              settingsProvider.changeTheme(ThemeMode.dark);
            },
            child: settingsProvider.isDarkMode()
                ? getSellectedItem(AppLocalizations.of(context)!.dark)
                : getUnsellectedItem(AppLocalizations.of(context)!.dark)

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
          style: Theme.of(context).textTheme.subtitle2?.
          copyWith(color:Theme.of(context).dividerColor),
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
