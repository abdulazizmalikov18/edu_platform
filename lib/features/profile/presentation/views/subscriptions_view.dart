import 'package:edu_platform/features/common/widgets/w_tab_bar.dart';
import 'package:edu_platform/features/profile/presentation/widgets/subscription_iteam.dart';
import 'package:flutter/material.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 52,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const WTabBar(
                tabs: [
                  Text('Previous'),
                  Text('Current'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) => const SubscriptionIteam(),
                  ),
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => const SubscriptionIteam(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
