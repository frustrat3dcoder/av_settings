import 'package:av_settings/config/app_config.dart';
import 'package:av_settings/config/size_config.dart';
import 'package:av_settings/presentation/business_logic/language_provider.dart';
import 'package:av_settings/presentation/settings_module/widgets/widgets.dart';
import 'package:av_settings/utils/constants/app_assets.dart';
import 'package:av_settings/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 20,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18)),
            title: Text('My Account',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 14))),
        body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FilledCustomTile(
                  iconPath: AppAssets.codeOfConduct,
                  onClickCallBack: () {},
                  title: 'Community Code of Conduct',
                ),
                FilledCustomTile(
                  iconPath: AppAssets.helpCentre,
                  onClickCallBack: () {},
                  title: 'Help Centre',
                ),
                FilledCustomTile(
                  iconPath: AppAssets.language,
                  onClickCallBack: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor:
                          Theme.of(context).appBarTheme.backgroundColor,
                      builder: (context) => LanguageBottomSheet(),
                    );
                  },
                  title: 'Edit My Languages',
                ),
                UnfilledCustomTile(
                  iconPath: AppAssets.switchBackground,
                  onClickCallBack: () {},
                  title: 'Customize Interface',
                  tileType: TileEnums.customInterface,
                ),
                UnfilledCustomTile(
                  onClickCallBack: () {},
                  title: 'Terms of Service',
                ),
                UnfilledCustomTile(
                  onClickCallBack: () {},
                  title: 'Privacy Policies',
                ),
                UnfilledCustomTile(
                  onClickCallBack: () {},
                  title: 'Temporarily Deactivate My Account',
                ),
                UnfilledCustomTile(
                  onClickCallBack: () {},
                  title: 'Permanently Delete My Account',
                ),
                FilledCustomTile(
                  iconPath: AppAssets.logout,
                  onClickCallBack: () {},
                  title: 'Logout',
                ),
                50.h,
                buildFooterLogo(context)
              ],
            ),
          ),
        ));
  }

  Widget buildFooterLogo(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.arreLogo,
            width: 88,
            height: 30,
            fit: BoxFit.contain,
          ),
          3.h,
          Image.asset(
            AppAssets.voiceLogo,
            width: 110,
            height: 30,
            fit: BoxFit.fitWidth,
          ),
          15.h,
          Text(
            'Version ${appConfig['appVersion']}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.blue,
                fontSize: 14,
                decorationColor: Colors.blue,
                decorationThickness: 2,
                decoration: TextDecoration.underline),
          ),
          15.h,
        ],
      ),
    );
  }
}

class LanguageBottomSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(languageProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.white),
          ),
          Text(
            'Edit Languages:',
            style: Theme.of(context).textTheme.displayMedium!,
          ),
          10.h,
          Text(
            'Select the languages VoicePods to be in',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.grey.withOpacity(0.6), fontSize: 16),
          ),
          10.h,
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 60,
                childAspectRatio: 1.2),
            shrinkWrap: true,
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final language = languages[index];
              return Stack(
                alignment: Alignment.topRight,
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(languageProvider.notifier).toggle(language);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: language.isSelected!
                                ? Colors.orange
                                : Colors.teal.withOpacity(0.5),
                          ),
                          color: const Color(0xff232C36)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            language.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: language.isSelected!
                                        ? Colors.orange
                                        : Colors.teal),
                          ),
                          if (language.alternateName != '')
                            Text(
                              language.alternateName!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: language.isSelected!
                                          ? Colors.orange
                                          : Colors.teal),
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (language.isSelected == true)
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Image.asset(
                        AppAssets.selectIcon,
                        width: 20,
                        height: 20,
                      ),
                    )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
