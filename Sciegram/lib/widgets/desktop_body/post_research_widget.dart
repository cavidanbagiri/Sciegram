import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sciegram/routers/app_routes.dart';

Widget postResearchWidget() {
  return Center(
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('/img/klon.jpg'),
                ),
                margin: const EdgeInsets.only(left: 10),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    print('Clicked');
                    Get.toNamed(Routes.POSTRESEARCH);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: const Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Create Research',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: InkWell(
                      onTap: () {
                      },
                      child: TextButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.POSTRESEARCH);
                        },
                        icon: const Icon(
                          Icons.photo,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Photo',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {},
                      child: TextButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.POSTRESEARCH);
                        },
                        icon: const Icon(
                          Icons.video_camera_back,
                          color: Colors.blue,
                        ),
                        label: const Text(
                          'Video',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: TextButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.POSTRESEARCH);
                      },
                      icon: const Icon(
                        Icons.book,
                        color: Colors.green,
                      ),
                      label: const Text(
                        'Text',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: TextButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.POSTRESEARCH);
                      },
                      icon: const Icon(
                        Icons.light,
                        color: Colors.orange,
                      ),
                      label: const Text(
                        'Research',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
