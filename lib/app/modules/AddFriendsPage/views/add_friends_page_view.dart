import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_friends_page_controller.dart';

class AddFriendsPageView extends GetView<AddFriendsPageController> {
  const AddFriendsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddFriendsPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddFriendsPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
