import 'package:flutter/material.dart';
import 'package:noteapp/presentation/widdgets/customBottom.dart';
import 'package:noteapp/presentation/widdgets/cutomTextFeild.dart';

class CustomModelSheet extends StatelessWidget {
  const CustomModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 370,
        child: ListView(
          children: [
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
              child: CustomTextField(hintText: 'title', lable: 'title'),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 14),
              child: CustomTextField(hintText: 'content', lable: 'Content'),
            ),
            CustomButton(text: 'Add', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
