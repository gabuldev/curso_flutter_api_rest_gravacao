import 'package:flutter/material.dart';
import 'package:flutter_api_rest/features/start/start_repository.dart';
import 'package:flutter_api_rest/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter_api_rest/shared/widgets/post_card_widget.dart';
import 'package:flutter_api_rest/shared/widgets/text_widget.dart';

import '../../shared/models/post.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final repository = StartRepositoryImpl();
  List<Post> posts = [];
  var isLoading = false;
  String? error;
  //FUTURE -> async, await
  Future<void> getPosts() async {
    try {
      isLoading = true;
      final response = await repository.getPosts();
      posts = response;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      error = e.toString();
    } finally {
      setState(() {});
    }
  }

  @override
  void initState() {
    getPosts();
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
      return SingleChildScrollView(
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
              ...posts.map((e) => PostCard(post: e)).toList()
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.start(),
      body: mountBody(),
    );
  }
}
