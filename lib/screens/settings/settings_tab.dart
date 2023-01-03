import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_1/screens/settings/theme_bottom_sheet.dart';

import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  static const String routName='settings tab';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    // var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          Text('theme'
            // style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 2),
                  color: Color.fromARGB(1, 1, 1, 1)),
              child: Text('theme'
                // settingsProvider.isDarkMode()
                //     ?AppLocalizations.of(context)!.dark_theme
                //     :AppLocalizations.of(context)!.light_theme,
                // style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text('language'
            // AppLocalizations.of(context)!.language,
            // style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 2),
                  color: Color.fromARGB(1, 1, 1, 1)),
              child: Text('english'
                // settingsProvider.currentLanguage == 'en'
                //     ? AppLocalizations.of(context)!.english
                //     : AppLocalizations.of(context)!.arabic,
                // style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageBottomSheet();
        });
  }

}
