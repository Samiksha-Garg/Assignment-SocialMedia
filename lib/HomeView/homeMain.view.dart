import 'package:flutter/material.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:assign_social_media/styles/colors.dart';
import 'home.view.dart';

class HomeMainView extends StatefulWidget {
  const HomeMainView({Key? key}) : super(key: key);

  @override
  State<HomeMainView> createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FeedView(),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(MfgLabs.home,
                      color: index == 0 ? AppColors.pastelBlue : Colors.grey),
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.search,
                      color: index == 1 ? AppColors.pastelBlue : Colors.grey),
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundColor: AppColors.pastelBlue,
                    radius: 30,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        Icons.add,
                        color: AppColors.pastelBlue,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Stack(
                    children: <Widget>[
                      Icon(Icons.email_outlined,
                          color:
                              index == 2 ? AppColors.pastelBlue : Colors.grey),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 9,
                            minHeight: 9,
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.person_outlined,
                      color: index == 3 ? AppColors.pastelBlue : Colors.grey),
                  onPressed: () {
                    setState(() {
                      index = 3;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
