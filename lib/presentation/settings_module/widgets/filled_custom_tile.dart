import 'package:av_settings/utils/utils.dart';
import 'package:flutter/material.dart';

class FilledCustomTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function() onClickCallBack;
  const FilledCustomTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onClickCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClickCallBack(),
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.teal),
                child: Image.asset(
                  iconPath,
                  fit: BoxFit.contain,
                  width: 11,
                  height: 11,
                )),
            15.w,
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            )
          ],
        ),
      ),
    );
  }
}
