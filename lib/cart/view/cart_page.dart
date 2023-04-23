import 'package:flutter/material.dart';

import '../../util/app_bar.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: createStylishAppBar(context),
        body: LayoutBuilder(builder: (context, constraints) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: MobileCartPage(),
          ));
        }));
  }
}

class MobileCartPage extends StatelessWidget {
  const MobileCartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 100),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text('信用卡號碼'),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '輸入信用卡號碼',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 100),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text('有效期限'),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '輸入有效期限',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 100),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text('安全碼'),
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '輸入安全碼',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("確認付款")),
        ],
      ),
    );
  }
}
