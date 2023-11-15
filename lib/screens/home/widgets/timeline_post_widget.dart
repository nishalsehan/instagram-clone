
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/constants.dart';
import 'package:instagram_clone/widgets/avatar.dart';

class TimelinePostWidget extends StatefulWidget{
  const TimelinePostWidget({super.key});

  @override
  State<TimelinePostWidget> createState() => TimelinePostWidgetState();
}

class TimelinePostWidgetState extends State<TimelinePostWidget> with SingleTickerProviderStateMixin {

  bool liked = false;
  bool saved = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
               Row(
                 children: [
                   const Avatar(url: profileAvatar, size: 33),
                   const SizedBox(width: 12),
                   Text(
                     'uplabsofficial',
                     style: Theme.of(context).textTheme.labelSmall!.copyWith(
                       fontWeight: FontWeight.w500
                     ),
                   )
                 ],
               ),
              Positioned(
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/icons/more.svg'
                  )
              )
            ],
          ),
        ),
        GestureDetector(
          onDoubleTap: (){
              setState(() {
                liked = true;
              });
            },
          child: CachedNetworkImage(
            imageUrl: 'https://netstorage-tuko.akamaized.net/images/3f9289668996a14f.jpg?imwidth=900',
            fit: BoxFit.fitWidth,
            width: size.width,
          ),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        liked = !liked;
                      });
                    },
                    child: SvgPicture.asset(
                      liked?'assets/icons/heart-filled.svg':'assets/icons/heart-outline.svg',
                      height: 29,
                      colorFilter: ColorFilter.mode(liked?Colors.redAccent:Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  SvgPicture.asset(
                    'assets/icons/comments.svg',
                    height: 29,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  SvgPicture.asset(
                    'assets/icons/share.svg',
                    height: 29,
                  ),
                ],
              ),
              Positioned(
                  right: 0,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        saved = !saved;
                      });
                    },
                    child: SvgPicture.asset(
                      saved?'assets/icons/save-filled.svg':'assets/icons/save-outline.svg',
                      height: 29,
                    ),
                  )
              )
            ],
          ),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1 like',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: 'uplabsofficial ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' LINK IN BIO - Get All these Dog Products for 50% OFF ❤️ Sale Ends Soon ⏳',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                              fontSize: 14,
                          fontFamily: DefaultTextStyle.of(context).style.fontFamily
                        ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '4 minutes ago',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          )
        ),
        const SizedBox(height: 12)
      ],
    );
  }
}