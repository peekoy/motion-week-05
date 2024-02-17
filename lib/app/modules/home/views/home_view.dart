import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/app/data/model/story_model.dart';
import 'package:get_cli/app/modules/profile/views/profile_view.dart';
import 'package:get_cli/app/modules/reels/views/reels_view.dart';
import 'package:get_cli/app/modules/search_page/views/search_page_view.dart';
import 'package:get_cli/app/modules/shopping/views/shopping_view.dart';
import 'package:get_cli/shared/widgets/image_story.dart';
import 'package:get_cli/shared/widgets/post_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (context) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leadingWidth: 150,
              leading: TextButton(
                onPressed: () {},
                child: Text(
                  'Instagram',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.chat_outlined),
                ),
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.add_box_outlined),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16,),
                    height: 97.75,
                    child: ListView.builder(
                      itemCount: controller.storyModel.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        StoryModel data = controller.storyModel[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: ImageStory(
                            story: data,
                            onTap: () {
                              controller.toStoryPageView(data.storyItems);
                            },
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Post(
                    postModel: controller.postModel,
                    onPressed: controller.changeIconLike,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  // IndexedStack(
                  //   index: controller.tabIndex,
                  //   children: [
                  //     SearchPageView(),
                  //     ReelsView(),
                  //     ShoppingView(),
                  //     ProfileView(),
                  //   ],
                  // )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.black,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'search_page',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection_outlined),
                  label: 'reels',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket_outlined),
                  label: 'shopping',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'profile',
                ),
              ]
            ),
          ),
        );
      }
    );
  }
}
