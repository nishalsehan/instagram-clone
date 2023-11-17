

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screens/home/pages/view_story.dart';
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
      'name': 'Alexa',
      'viewed': false,
      'stories': [
        {'url':'https://images.lifestyleasia.com/wp-content/uploads/sites/2/2022/11/21110830/Untitled-design-2022-11-21T083748.810-1600x900.jpg'},
        {'url':'https://cloudfront-us-east-2.images.arcpublishing.com/reuters/TVO76CDW5VOCXOIYBW67B76BVY.jpg',},
        {'url':'https://images.moneycontrol.com/static-mcnews/2022/12/5-messi-fans-gear-up-for-semi-final-770x433.jpg?impolicy=website&width=770&height=431',},
        {'url':'https://media.gq-magazine.co.uk/photos/6481a49fb4c3aec3e98eb003/16:9/w_2560%2Cc_limit/GettyImages-1249814715.jpg',},
        {'url':'https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/10D00/production/_128046886_lionelmessi.jpg',},
        {'url':'https://englishtribuneimages.blob.core.windows.net/gallary-content/2022/12/2022_12\$largeimg_111321063.JPG'},
        {'url':'https://www.newarab.com/sites/default/files/1245748386.jpeg'}
      ]
    },
    {
      'avatar': 'https://images.inc.com/uploaded_files/image/1920x1080/getty_624206636_200013332000928034_376810.jpg',
      'name': '___imishxi____',
      'viewed': false,
      'stories':[
        {'url':'https://w0.peakpx.com/wallpaper/275/270/HD-wallpaper-nice-aman-surbhi.jpg',},
        {'url':'https://i.pinimg.com/736x/82/15/1a/82151a3146f7eb1a4ebd8d550ff93136.jpg',},
        {'url':'https://file.pngbackground.com/uploads/preview/nature-photo-studio-background-hd-images-11649575068211dagsbvm.jpg'}
      ]
    },
    {
      'avatar': 'https://media.istockphoto.com/id/1138438251/photo/woman-drinking-wine-while-listening-her-favorite-on-smart-phone.jpg?s=612x612&w=0&k=20&c=wP_hzpmT9tCDlMF6-r2D_-G7WVTrntDy1HFpS-RJyGk=',
      'name': 'ashishen94',
      'viewed': false,
      'stories':[
        {'url':'https://images.shiksha.com/mediadata/ugcDocuments/images/wordpressImages/2020_08_Trending-Technologies-scaled.jpg'},
        {'url':'https://images.businessnewsdaily.com/app/uploads/2022/04/04082844/1554241953.jpeg'},
        {'url':'https://hips.hearstapps.com/hmg-prod/images/best-tech-gift-guide-654d3f191a694.jpg?crop=0.502xw:1.00xh;0.154xw,0&resize=640:*'},
        {'url':'https://media.istockphoto.com/id/1331910730/photo/woman-using-banking-app-on-the-smartphone-pay-utility-bill-financial-technology-internet.jpg?s=612x612&w=0&k=20&c=hqUMR6OlPk0XTaREdldR2ymELLEosE5F98tP3_10k_g='},
      ]
    },
    {
      'avatar': 'https://people.com/thmb/aCjjh6SorCeOCO5hARpIvM3QVI8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(979x239:981x241)/Simone-Biles-Jonathan-Owens-042223-01-2000-5683ec1f773745218562a5c12857d2f8.jpg',
      'name': 'manaskushik',
      'viewed': false,
    },
    {
      'avatar': 'https://images.immediate.co.uk/production/volatile/sites/3/2017/11/peaky-tommy-5d3c20b.jpg?quality=90&resize=620,414',
      'name': 'deepakkumar2142',
      'viewed': false,
    },
    {
      'avatar': 'https://media.istockphoto.com/id/1440149723/photo/happy-man-social-media-phone-and-living-room-relax-typing-smartphone-and-online-communication.webp?b=1&s=170667a&w=0&k=20&c=G_u5nOP54j90M_S-qjoFxQi7E_sr4cgnKneIUy0agU0=',
      'name': 'sean.antonbarlonse',
      'viewed': false,
    },
    {
      'avatar': 'https://www.mayoclinichealthsystem.org/-/media/national-files/images/hometown-health/2022/person-wet-from-swimming-and-smiling.jpg?sc_lang=en',
      'name': 'guilhermepereira5342',
      'viewed': false,
    },
  ];

  List posts = [
    {
      "images": [
        'https://images.ctfassets.net/az3stxsro5h5/NjZUwfga63k7mTZCeKhvH/2cbcc7fa1e907b0a9d37155077c253f8/Nov1-What_to_Post_on_Instagram_When_You_re_Fresh_Out_of_Ideas-Newsletter-Feature-FL',
        'https://i0.wp.com/geardiary.com/wp-content/uploads/2013/02/20130212-101840.jpg',
      ],
      "user":{
        "username": 'shainuestk02',
        "avatar": 'https://media.istockphoto.com/id/1011792072/photo/smiling-young-mixed-race-businesswoman-looking-away.jpg?s=612x612&w=0&k=20&c=TVcVAcA27Xt9h3WASzOXLCTNmdZU9EMce4t7SU0G0ng='
      },
      "location": 'Colombo, Sri Lanka',
      "caption": 'Embracing the world through a pixelated lens, one selfie at a time. 📸✨ Lost in the symphony of notifications, yet finding serenity in the scroll. 🌟 #DigitalDiaries #PhoneInHandLifeInFocus',
      "likes": 2353,
      "create_at": '4 min ago'
    },
    {
      "images": [
        'https://netstorage-tuko.akamaized.net/images/3f9289668996a14f.jpg?imwidth=900',
      ],
      "user":{
        "username": 'uplabsofficial',
        "avatar": 'https://media.istockphoto.com/id/1203044189/photo/happy-african-businessman-worker-looking-at-smart-watch-at-work.webp?b=1&s=170667a&w=0&k=20&c=iIMuQWgcpounP34l5vqkWnAnOPZnMY-4XdaEupJGvag='
      },
      "caption": 'Taking a moment to pause on life\'s staircase and reflect. 🌟 Each step, a chapter; each pause, a chance to breathe. 🍃✨ \n.\n.\n#StaircaseChronicles #ReflectionsInTheQuiet',
      "likes": 42,
      "create_at": '12 hours ago'
    },
    {
      "images": [
        'https://images.lifestyleasia.com/wp-content/uploads/sites/2/2022/11/21110830/Untitled-design-2022-11-21T083748.810-1600x900.jpg',
        'https://cloudfront-us-east-2.images.arcpublishing.com/reuters/TVO76CDW5VOCXOIYBW67B76BVY.jpg',
        'https://images.moneycontrol.com/static-mcnews/2022/12/5-messi-fans-gear-up-for-semi-final-770x433.jpg?impolicy=website&width=770&height=431',
        'https://media.gq-magazine.co.uk/photos/6481a49fb4c3aec3e98eb003/16:9/w_2560%2Cc_limit/GettyImages-1249814715.jpg',
        'https://ichef.bbci.co.uk/live-experience/cps/624/cpsprodpb/10D00/production/_128046886_lionelmessi.jpg',
        'https://englishtribuneimages.blob.core.windows.net/gallary-content/2022/12/2022_12\$largeimg_111321063.JPG',
        'https://www.newarab.com/sites/default/files/1245748386.jpeg'
      ],
      "user":{
        "username": 'leomessi',
        "verified": true,
        "avatar": 'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/145c89ccd6e1f99b79643d53b58927d48a710c438968bf9417c8314585f96cd3._RI_TTW_SX720_FMjpg_.jpg'
      },
      "caption": """La Victoria está en la Mente. Una larga tradición artesanal construyendo baúles fotografiada por para. """,
      "likes": 53223,
      "create_at": '3 days ago'
    },
    {
      "images": [
        'https://i.insider.com/5bce0b4fd2e6481f3b640b86?width=700',
      ],
      "user":{
        "username": 'davidm_ai',
        "avatar": 'https://www.rover.com/blog/wp-content/uploads/cat-favorite-person-min.jpg'
      },
      "location": 'United States',
      "caption": """Dear ocean, Thank you for making us feel tiny, salty, humble and inspired, all at once.""",
      "likes": 15,
      "create_at": '23 October'
    },
    // {
    //   "image": '',
    //   "user":{
    //     "username": '',
    //     "avatar": ''
    //   },
    //   "caption": '',
    //   "likes": 0,
    //   "create_at": ''
    // },
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
              SliverToBoxAdapter(
                child: Container(
                  width: size.width,
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StoryAvatarWidget(
                          avatar: profileAvatar,
                          name: '',
                          myStory: true,
                          onClicked: (context){},
                          viewed: false,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: stories.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return StoryAvatarWidget(
                              avatar: stories[index]['avatar'],
                              name: stories[index]['name'],
                              viewed: stories[index]['viewed'],
                              onClicked: (buildContext){
                                if(stories[index]['stories'] != null){
                                  RenderBox box = buildContext.findRenderObject() as RenderBox;
                                  Offset position = box.localToGlobal(const Offset(1,1));
                                  Offset offset = Offset(position.dx - (size.width/2), position.dy - (size.height/2));
                                  _openCustomDialog(buildContext, offset, index);
                                }
                              },
                            );
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
                )
              ),
              // SliverAnimatedList(
              //     initialItemCount: posts.length,
              //     itemBuilder: (BuildContext context, int index, Animation animation) {
              //       return TimelinePostWidget(key: UniqueKey(),post: posts[index]);
              //     }
              // ),
              SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      return TimelinePostWidget(post: posts[index]);
                    },
                    addRepaintBoundaries: false,
                    childCount: posts.length, // Adjust this according to your needs
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  void _openCustomDialog(parentContext,Offset offset, int index) {
    showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            origin:  offset,
            child: Opacity(
              opacity: a1.value,
              child: widget
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return  ViewStory(user: stories[index]);
        }
     ).then((value){
       setState(() {
         stories[index]['viewed'] = true;
       });
    });
  }
}