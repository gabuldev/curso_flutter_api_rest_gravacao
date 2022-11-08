import 'package:flutter/material.dart';
import 'package:flutter_api_rest/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_api_rest/shared/widgets/text_widget.dart';

import '../../shared/models/author.dart';
import '../../shared/models/post.dart';
import '../../shared/widgets/post_card_widget.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.start(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              TextWidget.h8("Lista de Novidades"),
              const SizedBox(
                height: 16,
              ),
              ...List.generate(
                20,
                (index) => PostCard(
                    post: Post(
                        title: "Lorem Ipsum",
                        tags: ["Android"],
                        readTime: "5 min",
                        photoUrl: "https://picsum.photos/1920/1080",
                        hasReadLater: false,
                        author: Author(
                            id: "id",
                            name: "Augusto",
                            profileUrl: "https://picsum.photos/100/100"))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
