import 'package:eat_meat/components/account_settings.dart';
import 'package:eat_meat/components/icon_widget.dart';
import 'package:eat_meat/util/date_picker_util.dart';
import 'package:eat_meat/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: 'General',
              children: [
                const AccountSettings(),
                buildLogout(),
                buildDeleteAccount(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLogout() {
    const name = 'Log Out';
    return SimpleSettingsTile(
      title: name,
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.logout,
        color: Colors.blue,
      ),
      onTap: () => DatePickerUtil.showSnackBar(context, name),
    );
  }

  Widget buildDeleteAccount() {
    const name = 'Delete account';
    return SimpleSettingsTile(
      title: name,
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.delete,
        color: Colors.pink,
      ),
      onTap: () => showCupertinoDialog(
          context: context,
          builder: (context) => Util.createDialog(
                context,
                title: 'Warning!',
                content: 'You will lose all your account information',
              )),
    );
  }
}
