

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/constants.dart';
import '../widgets/story_avatar_widget.dart';
import '../widgets/timeline_post_widget.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  List stories = [
    {
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
      'name': 'Alexa'
    },
    {
      'avatar': 'https://images.inc.com/uploaded_files/image/1920x1080/getty_624206636_200013332000928034_376810.jpg',
      'name': '___imishxi____'
    },
    {
      'avatar': 'https://media.istockphoto.com/id/1138438251/photo/woman-drinking-wine-while-listening-her-favorite-on-smart-phone.jpg?s=612x612&w=0&k=20&c=wP_hzpmT9tCDlMF6-r2D_-G7WVTrntDy1HFpS-RJyGk=',
      'name': 'ashishen94'
    },
    {
      'avatar': 'https://people.com/thmb/aCjjh6SorCeOCO5hARpIvM3QVI8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(979x239:981x241)/Simone-Biles-Jonathan-Owens-042223-01-2000-5683ec1f773745218562a5c12857d2f8.jpg',
      'name': 'manaskushik'
    },
    {
      'avatar': 'https://images.immediate.co.uk/production/volatile/sites/3/2017/11/peaky-tommy-5d3c20b.jpg?quality=90&resize=620,414',
      'name': 'deepakkumar2142'
    },
    {
      'avatar': 'https://media.istockphoto.com/id/1440149723/photo/happy-man-social-media-phone-and-living-room-relax-typing-smartphone-and-online-communication.webp?b=1&s=170667a&w=0&k=20&c=G_u5nOP54j90M_S-qjoFxQi7E_sr4cgnKneIUy0agU0=',
      'name': 'sean.antonbarlonse'
    },
    {
      'avatar': 'https://www.mayoclinichealthsystem.org/-/media/national-files/images/hometown-health/2022/person-wet-from-swimming-and-smiling.jpg?sc_lang=en',
      'name': 'guilhermepereira5342'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: false,
                elevation: 0,
                excludeHeaderSemantics: true,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  // height: 30,
                  width: size.width,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/header-text.svg',
                        height: 40,
                      ),
                      Positioned(
                          right: 0,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/heart-outline.svg',
                                height: 28,
                              ),
                              const SizedBox(width: 24),
                              SvgPicture.asset(
                                'assets/icons/message-outline.svg',
                                height: 28,
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if(index == 0)Container(
                          width: size.width,
                          height: 120,
                          margin: const EdgeInsets.only(bottom: 8),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const StoryAvatarWidget(avatar: profileAvatar, name: '', myStory: true),
                                const SizedBox(
                                  width: 12,
                                ),
                                ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: stories.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index){
                                      return StoryAvatarWidget(avatar: stories[index]['avatar'], name: stories[index]['name']);
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return const SizedBox(
                                        width: 12,
                                      );
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                        const TimelinePostWidget()
                      ],
                    );
                  },
                  childCount: 3, // Adjust this according to your needs
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}