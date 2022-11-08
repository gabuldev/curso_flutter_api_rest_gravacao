import 'package:flutter/material.dart';
import 'package:flutter_api_rest/features/create_post/create_post_page.dart';
import 'package:flutter_api_rest/features/current_user_profile/current_user_profile_page.dart';
import 'package:flutter_api_rest/features/feed/feed_page.dart';
import 'package:flutter_api_rest/features/home/home_page.dart';
import 'package:flutter_api_rest/features/notifications/notifications_page.dart';
import 'package:flutter_api_rest/features/start/start_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balta Gabuldev Blog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ).copyWith(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: HomePage(
        pages: [
          PageConfig(
              id: "/home",
              label: "Início",
              icon: FontAwesomeIcons.house,
              builder: (context) => const StartPage()),
          PageConfig(
              id: "/feed",
              label: "Explorar",
              icon: FontAwesomeIcons.hashtag,
              builder: (context) => const FeedPage()),
          PageConfig(
              id: "/novo-post",
              icon: FontAwesomeIcons.plus,
              builder: (context) => const CreatePostPage()),
          PageConfig(
              id: "/notifications",
              label: "Notificações",
              icon: FontAwesomeIcons.bell,
              builder: (context) => const NotificationsPage()),
          PageConfig(
              id: "/profile",
              label: "Perfil",
              icon: FontAwesomeIcons.user,
              builder: (context) => const CurrentUserProfilePage()),
        ],
      ),
    );
  }
}
