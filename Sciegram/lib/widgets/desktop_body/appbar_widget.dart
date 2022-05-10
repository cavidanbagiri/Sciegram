import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciegram/controllers/login_controller.dart';
import 'package:sciegram/routers/app_routes.dart';
import 'package:badges/badges.dart';

PreferredSizeWidget? AppBarWidget() {
  final controller = Get.put(LoginPageController());
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.blueGrey),
      title: Container(
        height: 50,
        width: 120,
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.HOME);
          },
          child: const Center(
            child: Text(
              'Sciegram',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 30),
          child: IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              size: 30,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 30),
          child: Badge(
            badgeContent: const Text(
              '9',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: const Icon(
                Icons.people,
                size: 30,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 30),
          child: IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
        ),
        Obx(() {
          if (controller.googleAccount.value == null) {
            return Container(
              margin: const EdgeInsets.only(right: 30),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.blueGrey,
                ),
                label: const Text('Unknown'),
              ),
            );
          } else {
            return InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 30),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: Image.network(
                              controller.googleAccount.value?.photoUrl ?? '')
                          .image,
                    ),
                    Text(
                      '${controller.googleAccount.value?.displayName.toString()}',
                      style: TextStyle(color: Colors.blueGrey),
                    )
                  ],
                ),
              ),
            );
          }
        }),
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(child: Obx(() {
                if (controller.googleAccount.value == null) {
                  return ListTile(
                    title: Text('Login'),
                    leading: Icon(Icons.login),
                    onTap: (){
                      Get.toNamed(Routes.LOGIN);
                    },
                  );
                } else {
                  return ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: (){
                      controller.logout();
                    },
                  );
                }
              }))
            ];
          },
        )
      ],
    ),
  );
}
