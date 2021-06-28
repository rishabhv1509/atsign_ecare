// import 'package:at_contacts_group_flutter/screens/group_contact_view/group_contact_view.dart';

import 'package:at_contacts_flutter/screens/contacts_screen.dart';
import 'package:at_onboarding_flutter/screens/private_key_qrcode_generator.dart';
import 'package:atsign_ecare/routes/route_names.dart';
import 'package:atsign_ecare/screens/home/home.dart';
import 'package:atsign_ecare/screens/welcome_screen/welcome_screen.dart';
import 'package:atsign_ecare/services/navigation_service.dart';

import 'package:flutter/material.dart';

class SetupRoutes {
  static String initialRoute = Routes.HOME;

  static Map<String, WidgetBuilder> get routes {
    return {
      Routes.HOME: (context) => Home(),
      // Routes.WEBSITE_SCREEN: (context) {
      //   Map<String, dynamic> args =
      //       ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      //   return WebsiteScreen(title: args["title"], url: args["url"]);
      // },
      Routes.WELCOME_SCREEN: (context) => WelcomeScreen(),
      // Routes.FAQ_SCREEN: (context) => WebsiteScreen(
      //       title: 'FAQ',
      //       url: '${MixedConstants.WEBSITE_URL}/faqs',
      //     ),
      // Routes.TERMS_CONDITIONS: (context) => TermsConditions(),

      Routes.CONTACT_SCREEN: (context) {
        Map<String, dynamic> args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        return ContactsScreen(
            asSelectionScreen: args['asSelectionScreen'],
            context: NavService.navKey.currentContext,
            selectedList: args['selectedList']);
      },

      Routes.PRIVATE_KEY_GEN_SCREEN: (context) => PrivateKeyQRCodeGenScreen(),
    };
  }
}
