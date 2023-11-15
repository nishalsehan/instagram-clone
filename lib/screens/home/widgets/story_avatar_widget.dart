
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/avatar.dart';
import 'package:provider/provider.dart';

import '../../../themes/theme_barrel.dart';
import '../../../utils/gradient_border.dart';

List<Color> get getColorsList =>  [ const Color(0xFFbc2a8d),const Color(0xFFfccc63), const Color(0xFFfbad50)];

class StoryAvatarWidget extends StatelessWidget{
  final String avatar;
  final String name;
  final bool myStory;

  const StoryAvatarWidget({super.key, required this.avatar, required this.name, this.myStory = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
                alignment: Alignment.center,
                height: 95,
                padding: const EdgeInsets.all(3),
                decoration: myStory?null:BoxDecoration(
                  border: GradientBorder(
                    width: 3.2,
                    borderGradient: LinearGradient(
                      colors: getColorsList,
                      tileMode: TileMode.repeated,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: const GradientRotation(0.0),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Avatar(
                    url: avatar,
                    size: 90,
                  ),
                )
            ),
            if(myStory)Positioned(
                bottom: 3,
                right: 3,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 4
                      ),
                      color: Colors.blue,
                      shape: BoxShape.circle
                  ),
                  padding: const EdgeInsets.all(2),
                  child: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.white,
                  ),
                )
            )
          ],
        ),
        const SizedBox(height: 2),
        SizedBox(
          width: 95,
          child: Consumer<ThemeNotifier>(
              builder: (context, theme, child){
                return Text(
                    myStory?'Your story':name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: myStory?theme.isDark()?Colors.white38:Colors.grey:null
                    )
                );
              }
          )
        )
      ],
    );
  }
}