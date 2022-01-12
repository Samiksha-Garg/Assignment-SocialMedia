import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.50 * size.height,
                  width: double.infinity,
                  child: const FittedBox(
                    fit: BoxFit.fill,
                    child: Image(
                      image: AssetImage("assets/images/circus.jpg"),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 32 + size.height * 0.08,
                        ),
                        const Text(
                          'Michelle Jonas',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesome.heart_empty,
                            color: Colors.grey,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send,
                            color: Colors.grey,
                          )),
                    ]),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 32, right: 10, bottom: 10),
                  child: Text(
                      'This circus nearby my apartment looks so nice and cool, and makes me feel so happy'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 32, right: 10, bottom: 10),
                  child: Text(
                    "#asthetics #analog #colors",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundImage: const AssetImage("assets/images/profile2.jpg"),
              radius: size.height * 0.04,
            ),
            top: 0.47 * size.height,
            left: 32,
          )
        ],
      ),
    );
  }
}
