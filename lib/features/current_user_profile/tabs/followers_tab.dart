import 'package:flutter/material.dart';
import 'package:flutter_api_rest/features/current_user_profile/current_user_profile_repository.dart';

import '../../../shared/models/user.dart';
import '../../../shared/widgets/user_card_widget.dart';

class FollowersTab extends StatefulWidget {
  const FollowersTab({Key? key}) : super(key: key);

  @override
  State<FollowersTab> createState() => _FollowersTabState();
}

class _FollowersTabState extends State<FollowersTab> {
  final repository = CurrentUserProfileRepositoryImpl();
  var isLoading = false;
  String? error;
  List<User> users = [];

  Future<void> getFollowers() async {
    try {
      isLoading = true;
      final response = await repository.getFollowers();
      users = response;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    getFollowers();
    super.initState();
  }

  Widget mountBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (error != null) {
      return Center(
        child: Text(error!),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: users
            .map((e) => UserCard(
                  user: e,
                ))
            .toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: mountBody(),
    ));
  }
}
