import 'package:flutter/material.dart';
import 'package:rexofarm/utilities/constants.dart';
import 'package:rexofarm/widgets/profile_extra_card.dart';
import 'package:rexofarm/widgets/profile_setting_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 18, 0),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'images/profile/menu_edit.png',
                  width: 30,
                  height: 28,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 39,
                        child: Icon(
                          Icons.person,
                          size: 70,
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Amuke Sunday',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text('Driver'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Expanded(
                        child: ProfileExtraCard(
                          widgetTitle: Text(
                            '17',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          description: 'Completed Shipments',
                        ),
                      ),
                      Expanded(
                        child: ProfileExtraCard(
                          widgetTitle: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.amber,
                              )
                            ],
                          ),
                          description: 'Avg. customer rating',
                        ),
                      ),
                      Expanded(
                        child: ProfileExtraCard(
                          widgetTitle: Icon(
                            Icons.check_circle,
                            size: 20,
                            color: Colors.green,
                          ),
                          description: 'Verified Driver',
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      'Account',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ProfileSettingTile(
                    fileName: 'profile.png',
                    title: 'Account information',
                    subtitle: 'Name, Phone number, Email address, etc',
                    onPressed: () {},
                  ),
                  ProfileSettingTile(
                    fileName: 'lock.png',
                    title: 'Password',
                    subtitle: 'Change your password',
                    onPressed: () {},
                  ),
                  ProfileSettingTile(
                    fileName: 'group.png',
                    title: 'Vehicle details',
                    subtitle: 'Vehicle Name, Number Plate, etc',
                    onPressed: () {},
                  ),
                  ProfileSettingTile(
                    fileName: 'tick-circle.png',
                    title: 'Verify profile',
                    subtitle: 'Complete KYC to verify profile',
                    onPressed: () {},
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      'Payment',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ProfileSettingTile(
                    fileName: 'payment.png',
                    title: 'Payment account',
                    subtitle: 'Account to withdraw funds into',
                    onPressed: () {},
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      'Help & Support',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ProfileSettingTile(
                    fileName: 'clipboard-text.png',
                    title: 'Terms of service',
                    onPressed: () {},
                  ),
                  ProfileSettingTile(
                    fileName: 'security-user.png',
                    title: 'Privacy policy',
                    onPressed: () {},
                  ),
                  ProfileSettingTile(
                    fileName: 'messages.png',
                    title: 'Customer support',
                    onPressed: () {},
                  ),
                  ProfileSettingTile(
                    fileName: 'close-circle.png',
                    title: 'Delete account',
                    subtitle: 'Delete your Rexofarm account',
                    color: kDeepRed,
                    onPressed: () {},
                  ),
                  ProfileSettingTile(
                    fileName: 'logout.png',
                    title: 'Logout',
                    color: kDeepRed,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
