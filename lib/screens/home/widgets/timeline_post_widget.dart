
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/themes/theme_barrel.dart';
import 'package:instagram_clone/widgets/avatar.dart';
import 'package:provider/provider.dart';

import '../../../utils/util_barrel.dart';

class TimelinePostWidget extends StatefulWidget{
  final Map post;
  const TimelinePostWidget({super.key, required this.post});

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
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Row(
                        children: [
                          Text(
                            '${widget.post['user']['username']}',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                height: 1
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          if(widget.post['user']['verified']??false)SvgPicture.asset(
                            'assets/icons/verified.svg',
                            height: 12,
                          )
                        ],
                      ),
                      if(widget.post['location'] != null)Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Consumer<ThemeNotifier>(
                          builder: (BuildContext context, ThemeNotifier theme, Widget? child) {
                            return Text(
                                '${widget.post['location']}',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w300,
                                  height: 1,
                                  color: theme.isDark()?Colors.white:Colors.black
                                )
                            );
                          },
                        ),
                      )
                    ],
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
            imageUrl: '${widget.post['image']}',
            fit: BoxFit.fitWidth,
            fadeInDuration: const Duration(milliseconds: 500),
            width: size.width,
            placeholderFadeInDuration: const Duration(milliseconds: 0),
            progressIndicatorBuilder: (_,__,___){
              return SizedBox(
                width: size.width,
                height: size.width*0.6,
              );
            },
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
                '${widget.post['likes']} likes',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 2),
              ReadMore(
                text: ' ${widget.post['caption']}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: DefaultTextStyle.of(context).style.fontFamily
                ),
                prefix: TextSpan(
                  text: '${widget.post['user']['username']}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),
                ),
                maxLines: 2,
                collapsedText: 'more',
                expandedText: '',
                readMoreTextColor: Colors.black54,
              ),
              const SizedBox(height: 2),
              Text(
                '${widget.post['create_at']}',
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

