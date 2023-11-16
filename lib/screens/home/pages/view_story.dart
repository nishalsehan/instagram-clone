
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/screens/home/widgets/story_widget.dart';
import 'package:instagram_clone/themes/dark_theme.dart';

class ViewStory extends StatefulWidget{
  const ViewStory({super.key});
  @override
  State<ViewStory> createState() => ViewStoryState();
}

class ViewStoryState extends State<ViewStory>{

  List stories = [
    'https://images.lifestyleasia.com/wp-content/uploads/sites/2/2022/11/21110830/Untitled-design-2022-11-21T083748.810-1600x900.jpg',
    'https://cloudfront-us-east-2.images.arcpublishing.com/reuters/TVO76CDW5VOCXOIYBW67B76BVY.jpg',
    'https://images.moneycontrol.com/static-mcnews/2022/12/5-messi-fans-gear-up-for-semi-final-770x433.jpg?impolicy=website&width=770&height=431',
    'https://media.gq-magazine.co.uk/photos/6481a49fb4c3aec3e98eb003/16:9/w_2560%2Cc_limit/GettyImages-1249814715.jpg',
    'https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/10D00/production/_128046886_lionelmessi.jpg',
    'https://englishtribuneimages.blob.core.windows.net/gallary-content/2022/12/2022_12\$largeimg_111321063.JPG',
    'https://www.newarab.com/sites/default/files/1245748386.jpeg'
  ];
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: darkTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                StoryWidget(
                  padding: padding,
                  url: stories.first,
                ),
                Container(
                  width: size.width,
                  height: size.height*0.8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.2), Colors.black.withOpacity(0.00)],
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                    )
                  ),
                ),
                Positioned(
                    right: 12,
                    top: 24,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            'assets/icons/more.svg',
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          height: 32,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                       InkWell(
                         onTap: (){
                           Navigator.of(context).pop();
                         },
                         child:  const Icon(
                           Icons.close,
                           color: Colors.white,
                           size: 40,
                         ),
                       )
                      ],
                    )
                )
              ],
            ),
            Container(
              height: size.height*0.09,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width*0.9 - 94,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(100)
                        ),
                        hintText: 'Send Message',
                        hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),

                      ),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white
                      )
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  SizedBox(
                    width: 76,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/heart-outline.svg',
                          height: 29,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        SvgPicture.asset(
                          'assets/icons/share.svg',
                          height: 29,
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}