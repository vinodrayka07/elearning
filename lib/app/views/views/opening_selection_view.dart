import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OpeningSelectionView extends GetView {
  const OpeningSelectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpeningSelectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OpeningSelectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
