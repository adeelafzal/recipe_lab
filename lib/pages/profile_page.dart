import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_lab/main.dart';
import 'package:recipe_lab/widgets/app_bar.dart';
import 'package:recipe_lab/widgets/image_view.dart';
import 'package:recipe_lab/widgets/rating_bar.dart';

class ProfilePage extends StatefulWidget {
  static const String route = '/ProfilePage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: ScaffoldState());
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Profile'),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 370,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: customImageView(
                        imageUrl:
                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                        width: 130,
                        height: 130),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'User Name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textColor,
                        fontFamily: 'Raleway',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Username@ggmail.com',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: textColor,
                        fontFamily: 'Raleway',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      statesCard('Followers', '1.5K'),
                      statesCard('Recipes', '500'),
                      statesCard('Views', '254'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: textColor,
                              fontFamily: 'Raleway',
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                        color: backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            side: BorderSide(
                              color: Colors.grey,
                            )),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RaisedButton(
                        child: Icon(
                          CupertinoIcons.photo_camera,
                          color: Colors.green,
                        ),
                        color: backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            side: BorderSide(
                              color: Colors.grey,
                            )),
                        onPressed: () {},
                      )
                    ],
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      'Follow',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600),
                    ),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.green.withOpacity(0.2),
                  child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(vertical: 8),
                    labelColor: Colors.green,
                    labelStyle: TextStyle(
                        fontFamily: 'Raleway',
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    unselectedLabelColor: textColor,
                    tabs: [
                      Text('Recipes (10)'),
                      Text('Reviews (6)'),
                    ],
                    controller: _tabController,
                  ),
                ),
                Container(
                  color: backgroundColor,
                  child: _tabController.index == 0
                      ? buildRecipes()
                      : buildReviews(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecipes() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      primary: false,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 6),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: customImageView(
                    imageUrl:
                        'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
              ),
              Positioned(
                top: 20,
                left: 0,
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Pizza',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          letterSpacing: 1,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildReviews() {
    return ListView.builder(
      itemCount: 6,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 3,
          margin: EdgeInsets.only(
              left: 10, right: 10, top: 8, bottom: index == 5 ? 8 : 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ListTile(
                dense: true,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: customImageView(
                    width: 50,
                    height: 50,
                    imageUrl:
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
                  ),
                ),
                title: Text(
                  'User Name',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      letterSpacing: 1,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '5 min ago',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    letterSpacing: 1,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildRatingBar(4.0),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '(4.0)',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          letterSpacing: 1,
                          color: textColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      letterSpacing: 1,
                      color: textColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget statesCard(String title, String value) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Text(value,
                  style: TextStyle(
                      color: textColor,
                      fontFamily: 'Raleway',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900)),
              SizedBox(
                height: 4,
              ),
              Text(title,
                  style: TextStyle(
                      color: textColor,
                      fontFamily: 'Raleway',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ));
  }
}
