import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:flutter/material.dart';

class ConnectionErrorScreen extends StatelessWidget {
  const ConnectionErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Expanded(flex: 2, child: SizedBox()),
            // Image.asset(MyIcons.connectionError, fit: BoxFit.contain),
            Text("Internet bilan aloqa yo'qoldi !!!",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 20),
                textAlign: TextAlign.center),
            const SizedBox(height: 10),
            const Text("Yoki server bilan aloqa uzildi!",
                textAlign: TextAlign.center),
            const Expanded(flex: 2, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: WButton(
                onTap: () {},
                text: 'TAKRORLASH',
                height: 46,
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
