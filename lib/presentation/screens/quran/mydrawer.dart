
import 'package:flutter/material.dart';
import 'package:islamyat/presentation/screens/quran/settings.dart';
import 'package:islamyat/presentation/utils/assets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              // color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    ImageAssets.splashLogo,
                    // width: double.infinity,
                    // height: 138,
                    fit: BoxFit.fill,
                  ),
                ),
                // const Text(
                //   'القرآن',
                //   style: TextStyle(fontSize: 20),
                // ),

              ],
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'Settings',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: const Text(
              'Share',
            ),
            onTap: () {
              Share.share('''*Quran app*\n
u can develop it from my github github.com/itsherifahmed ''');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.rate_review,
            ),
            title: const Text(
              'Rate',
            ),
            onTap: () async {
              // if (!await launchUrl(quranAppurl,
              //     mode: LaunchMode.externalApplication)) {
              //   throw 'Could not launch $quranAppurl';
              // }
            },
          ),

        ],
      ),
    );
  }
}


