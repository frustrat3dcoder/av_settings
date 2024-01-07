import 'package:av_settings/presentation/business_logic/business_logic.dart';
import 'package:av_settings/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnfilledCustomTile extends StatelessWidget {
  final String title;
  final String? iconPath;
  final Function() onClickCallBack;
  final TileEnums? tileType;

  const UnfilledCustomTile({
    super.key,
    required this.title,
    required this.onClickCallBack,
    this.iconPath,
    this.tileType = TileEnums.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Text(title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.displaySmall!),
          const Spacer(),
          getEnumByType()
        ],
      ),
    );
  }

  Widget getEnumByType() {
    switch (tileType) {
      case TileEnums.customInterface:
        return CustomSwitchWithImage(backgroundImage: iconPath!);
      default:
        return GestureDetector(
            onTap: () => onClickCallBack(),
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ));
    }
  }
}

class CustomSwitchWithImage extends ConsumerWidget {
  final String backgroundImage;
  const CustomSwitchWithImage({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customInterfaceValue = ref.watch(customInterfaceProvider);
    return GestureDetector(
      onTap: () {
        ref
            .read(customInterfaceProvider.notifier)
            .toggle(!customInterfaceValue);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              backgroundImage,
              width: 70,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: customInterfaceValue ? 30 : 0,
            child: Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: customInterfaceValue ? Colors.teal : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
