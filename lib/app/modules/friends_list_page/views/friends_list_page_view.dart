import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../CommonFile/CommonWidget.dart';
import '../../../colors/ApkColors.dart';
import '../controllers/friends_list_page_controller.dart';

class FriendsListPageView extends GetView<FriendsListPageController> {
  const FriendsListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FriendsListPageController());
    Get.lazyPut(() => FriendsListPageController());
    controller.count.value;
    return Scaffold(
        // appBar: CommonWidget.appBar(context: context, title: "Friends List"),
        body: Obx(() {
      controller.count.value;
      return Column(
        children: [
          CommonWidget.topbargredient(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 5, top: 5),
                    decoration: BoxDecoration(
                        color: ApkColors.backgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    width: 40,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        color: ApkColors.greenColor,
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      // controller.setFocus();
                      controller.increment();
                    },
                    child: Hero(
                      tag: "dashboard",
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          height: Get.height * 0.054,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 20),
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ApkColors.backgroundColor,
                            borderRadius: BorderRadius.circular(15),
                            // border: Border.all(color:ApkColors.greenColor,
                            //   width: 0.5),
                          ),
                          child: TextField(
                            textAlign: TextAlign.start,
                            cursorColor: ApkColors.greenColor,
                            onTap: () {},
                            autofocus: true,
                            onChanged: (value) {
                              controller.searchRecipes(value);
                            },
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Nunito-Bold',
                              color: ApkColors.greenColor,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: ApkColors.greenColor,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    Get.snackbar("title", "hhj");
                                  },
                                  icon: const Icon(
                                    Icons.settings,
                                    color: ApkColors.greenColor,
                                  ),
                                ),
                                hintText: "Search here events...",
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Nunito-Bold',
                                  color: ApkColors.greenColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              height: 160),
          const SizedBox(
            height: 20,
          ),
          controller.isLoading
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: CircularProgressIndicator(
                            color: ApkColors.orangeColor)),
                  ],
                )
              : Obx(() {
                  controller.count.value;
                  return (controller.searchList != null &&
                          controller.searchList!.isNotEmpty)
                      ? Expanded(child: GetBuilder<FriendsListPageController>(
                          builder: (context) {
                          return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              padding:
                                  EdgeInsets.only(left: 10.px, right: 10.px),
                              itemCount: controller.searchList?.length,
                              itemBuilder: (context, index) {
                                var item = controller.searchList?[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                ApkColors.greenColor,
                                            radius: 33.px,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  ApkColors.primaryColor,
                                              radius: 30.px,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: CommonWidget.imageView(
                                                    image: item?.image ??
                                                        "https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png",
                                                    height: 80.px,
                                                    width: 80.px,
                                                    defaultNetworkImage:
                                                        "https://server-php-8-2.technorizen.com/amuse/public/uploads/users/USER_IMG_75878.png"),
                                              ),
                                              //CircleAvatar
                                            ), //CircleAvatar
                                          ),
                                          SizedBox(
                                            width: 15.px,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 200,
                                                // color: ApkColors.orangeColor,
                                                padding:
                                                    EdgeInsets.only(right: 5),
                                                child: Text(
                                                  item!.email ?? "",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: 'Nunito-Bold',
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color:
                                                          ApkColors.greenColor,
                                                      fontSize: 15.px),
                                                ),
                                              ),
                                              Text(
                                                item.lastName ?? "kuch nhi",
                                                style: TextStyle(
                                                    fontFamily: 'Nunito-Bold',
                                                    fontWeight: FontWeight.w400,
                                                    color: ApkColors.greenColor,
                                                    fontSize: 14.px),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (controller.selectedIndexes
                                                  .contains(index)) {

                                               //controller.unSendRequest(item.id ?? '');
                                                showAlertDialog(context,"unfollow",item.id,controller,index);
                                                print("unfollow ${item.id}");
                                              } else {

                                                print("follow ${item.id}");
                                                showAlertDialog(context,"follow",item.id,controller,index);
                                                //controller.sendRequest(item.id ?? '');
                                              }


                                              // controler.[index] = !_likes[index];
                                            },
                                            child: Container(
                                              width: 70,
                                              height: 30,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: ApkColors.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                // border: Border.all(color:ApkColors.greenColor,
                                                //   width: 0.5),
                                              ),
                                              child: Text(

                                                item.request == "FOLLOWING" ? "Followed"
                                               : controller.selectedIndexes
                                                        .contains(index)
                                                    ? "Followed"
                                                    : "Follow",
                                                style: TextStyle(
                                                    fontSize: 17.px,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Nunito-Bold',
                                                    color:
                                                        ApkColors.greenColor),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              });
                        }))
                      : const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text("No data")
                            ),
                          ],
                        );
                })
        ],
      );
    }));
  }
}


   void showAlertDialog(BuildContext context, String s, String? id,
    FriendsListPageController controller, int index)
    {
  showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Alert'),
      content:  Text('Are you sure to $s this user ?'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(

          isDefaultAction: true,
          onPressed: () {
            // if (s == "follow"){
            //   controller.selectedIndexes.add(index);
            //   Navigator.pop(context);
            //   controller.increment();
            // }else{
            //   controller.selectedIndexes.remove(index);
            //   Navigator.pop(context);
            //   controller.increment();
            // }
            Navigator.pop(context);


          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          /// This parameter indicates the action would perform
          /// a destructive action such as deletion, and turns
          /// the action's text color to red.
          isDestructiveAction: true,
          onPressed: () {
           if (s == "follow"){
             controller.selectedIndexes.add(index);
             Navigator.pop(context);
             print("CupertinoDialogAction : follow");
             controller.increment();
             controller.sendRequest(id ?? "");

           }else{
             controller.selectedIndexes.remove(index);
             Navigator.pop(context);
             print("CupertinoDialogAction : Unfollow");
             controller.increment();
            controller.unSendRequest(id ?? "");

           }
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
