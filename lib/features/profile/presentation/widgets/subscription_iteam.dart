
import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class SubscriptionIteam extends StatelessWidget {
  const SubscriptionIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: dividerGrey),
        color: white,
      ),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: whiteGrey,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Weekly'),
                Text('\$29.00'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Validity period'),
                    const Spacer(),
                    Text(
                      'March 17',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('to'),
                    ),
                    Text(
                      'March 24',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Row(
                  children: [
                    const Text('Debit / Credit card'),
                    const Spacer(),
                    Text(
                      '**** 7327',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                Row(
                  children: [
                    const Text('Day left'),
                    const Spacer(),
                    Text(
                      '13 days',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                WButton(
                  margin: const EdgeInsets.only(top: 16),
                  onTap: () {},
                  text: 'Choose May 24 to May 31',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
