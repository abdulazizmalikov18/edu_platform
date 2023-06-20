import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/common/widgets/w_button.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

Future<dynamic> showEditor(
  BuildContext context, {
  required String title,
  required String hintText,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WTextField(
              onChanged: (value) {},
              hintText: hintText,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'Bekor qilish',
                    color: red,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'Tasdiqlash',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
