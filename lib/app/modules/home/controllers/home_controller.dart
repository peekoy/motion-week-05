import 'package:flutter/material.dart';
import 'package:get_cli/app/data/model/post_model.dart';
import 'package:get/get.dart';
import 'package:get_cli/app/data/model/story_model.dart';
import 'package:get_cli/app/modules/dashboard/views/dashboard_view.dart';
import 'package:get_cli/app/modules/profile/views/profile_view.dart';
import 'package:get_cli/app/modules/reels/views/reels_view.dart';
import 'package:get_cli/app/modules/search_page/views/search_page_view.dart';
import 'package:get_cli/app/modules/shopping/views/shopping_view.dart';
import 'package:get_cli/app/routes/app_pages.dart';
import 'package:story_view/story_view.dart';

class HomeController extends GetxController {
  var tabIndex = 0;
  final storyController = StoryController();
  PostModel postModel = PostModel(
    namaAkun: 'Faiz',
    description: 'Username Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
    fotoProfile: 'foto_profile',
    jumlahLike: 1,
    isLike: false,
    postingGambar: 'foto_posting',
    isSponsor: true,
  );

  List<StoryModel> storyModel = [];
  @override
  void onInit() {
    loadStoryModel();
    super.onInit();
  }

  void loadStoryModel() {
    storyModel = [
      StoryModel(
        image: 'foto_profile',
        namaAkun: 'Faiz',
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food, That's great", 
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Halo motion", 
            backgroundColor: Colors.red,
          ),
        ],
        isLoginAccount: true,
      ),
      StoryModel(
        image: 'foto_profile',
        namaAkun: 'Dennis',
        storyItems: [
          StoryItem.pageImage(
            url:
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption: "Still sampling",
            controller: storyController,
          ),
        ],
      ),
      StoryModel(
        image: 'foto_profile',
        namaAkun: 'Raka',
        storyItems: [
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: "Still sampling",
            controller: storyController,
          ),
        ],
      ),
    ];
    update();
  }

  void changeIconLike() {
    postModel.isLike = !postModel.isLike;
    if(postModel.isLike) {
      postModel.jumlahLike++;
    } else {
      postModel.jumlahLike--;
    }
    update();
  }

  void toStoryPageView(
    List<StoryItem>? storyItems,
  ) {
    Get.toNamed(
      Routes.SNAP_GRAM,
      arguments: {
        'story': storyItems,
      }
    );
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
  
  
}
