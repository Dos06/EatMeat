import 'package:eat_meat/util/date_picker_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'icon_widget.dart';

class AccountSettings extends StatelessWidget {
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  final name = 'Account Settings';

  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: name,
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.person,
        color: Colors.green,
      ),
      child: SettingsScreen(
        title: name,
        children: [
          buildLanguage(),
          buildLocation(),
        ],
      ),
      onTap: () => DatePickerUtil.showSnackBar(context, name),
    );
  }

  Widget buildLanguage() {
    const name = 'Language';
    return DropDownSettingsTile(
      settingKey: keyLanguage,
      selected: 1,
      values: const {
        1: 'English',
        2: 'Русский',
      },
      title: name,
      subtitle: '',
      onChange: (lang) {},
    );
  }

  Widget buildLocation() {
    const name = 'Location';
    return DropDownSettingsTile(
      settingKey: keyLocation,
      selected: 1,
      values: const {
        1: 'Almaty',
        2: 'Nur-Sultan',
        3: 'Shymkent',
      },
      title: name,
      subtitle: '',
      onChange: (lang) {},
    );
  }
}
