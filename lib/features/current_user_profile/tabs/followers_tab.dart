import 'package:flutter/material.dart';

import '../../../shared/models/user.dart';
import '../../../shared/widgets/user_card_widget.dart';

class FollowersTab extends StatelessWidget {
  const FollowersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            20,
            (index) => UserCard(
                  user: User(
                      id: " id",
                      email: "email@email.com",
                      bio: "Bio",
                      name: "Lorem Ipsum",
                      createdAt: "Desde Junho de 2021",
                      profileUrl: "https://picsum.photos/100/100"),
                )),
      ),
    ));
  }
}
