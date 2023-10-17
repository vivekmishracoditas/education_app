import 'package:education_app/Data/message_data.dart';
import 'package:education_app/Widget/course_list.dart';
import 'package:education_app/Widget/messages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  List<MessageData> getMessagesList() {
    List<MessageData> list = [];
    list.add(
      MessageData(
          name: 'Roger Hulg',
          messages: [
            Message(
              message: 'Hey, can I ask something? I need your help please',
              time: '15 min',
              isRead: false,
            ),
          ],
          profileImage:
              'https://s3.amazonaws.com/static.rogerebert.com/uploads/review/primary_image/reviews/hulk-2003/Hulk-2003-image.jpg'),
    );

    list.add(
      MessageData(
          name: 'Hilman Nuris',
          messages: [
            Message(
              message: 'thanks for your information dude!',
              time: 'Yesterday',
              isRead: true,
            ),
          ],
          profileImage:
              'https://img.etimg.com/thumb/width-640,height-480,imgsize-111746,resizemode-75,msid-91981734/magazines/panache/marvel-fans-note-changes-in-india-release-date-of-thor-love-and-thunder-movie-will-now-premiere-on-july-7/the-film-will-be-released-in-india-a-day-earlier-than-previously-planned-.jpg'),
    );

    list.add(
      MessageData(
          name: 'Erick Lawrence',
          messages: [
            Message(
              message: 'Did you take the free illustration class yesterday?',
              time: 'Yesterday',
              isRead: true,
            ),
          ],
          profileImage:
              'https://img.etimg.com/thumb/width-640,height-480,imgsize-111746,resizemode-75,msid-91981734/magazines/panache/marvel-fans-note-changes-in-india-release-date-of-thor-love-and-thunder-movie-will-now-premiere-on-july-7/the-film-will-be-released-in-india-a-day-earlier-than-previously-planned-.jpg'),
    );

    list.add(
      MessageData(
          name: 'Jennifer Dunn',
          messages: [
            Message(
              message:
                  'Hey Samuel, where did you get your point? can we exchange?',
              time: '2 week ago',
              isRead: true,
            ),
          ],
          profileImage:
              'https://www.israelhayom.com/wp-content/uploads/2020/11/People-Wonder_Woman-Gal_Gadot_95450.jpg-f4d19-750x375.jpg'),
    );

    list.add(
      MessageData(
          name: 'Andy Warhol',
          messages: [
            Message(
              message: 'that’s true bro, hahaha',
              time: '14/8/20',
              isRead: true,
            ),
          ],
          profileImage:
              'https://img.etimg.com/thumb/width-640,height-480,imgsize-111746,resizemode-75,msid-91981734/magazines/panache/marvel-fans-note-changes-in-india-release-date-of-thor-love-and-thunder-movie-will-now-premiere-on-july-7/the-film-will-be-released-in-india-a-day-earlier-than-previously-planned-.jpg'),
    );

    list.add(
      MessageData(
          name: 'Thomas Partrey',
          messages: [
            Message(
              message: 'thanks for your information dude!',
              time: '13/8/20',
              isRead: true,
            ),
          ],
          profileImage:
              'https://img.etimg.com/thumb/width-640,height-480,imgsize-111746,resizemode-75,msid-91981734/magazines/panache/marvel-fans-note-changes-in-india-release-date-of-thor-love-and-thunder-movie-will-now-premiere-on-july-7/the-film-will-be-released-in-india-a-day-earlier-than-previously-planned-.jpg'),
    );
    return list;
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: getAppBarWidget(),
        bottomNavigationBar: getBottomNavigationBar(),
        body: TabBarView(
          children: [
            CourseList(),
            const Icon(Icons.directions_transit),
            Messages(
              messagesList: widget.getMessagesList(),
            ),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }

  Padding getBottomNavigationBar() {
    return const Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 25),
      child: TabBar(
        tabs: [
          Icon(Icons.grid_view_rounded),
          Icon(Icons.flag_circle_rounded),
          Icon(Icons.email),
          Icon(Icons.person_3_rounded),
        ],
      ),
    );
  }

  AppBar getAppBarWidget() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
              'https://www.mckinsey.com/~/media/mckinsey/our%20people/vivek%20pandit/vivek%20pandit_std_img.jpg?cq=50&mw=480&car=1:1&cpy=Center'),
        ),
      ),
      title: getAppBarTitleWidget(),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            )),
      ],
      centerTitle: false,
    );
  }

  SizedBox getAppBarTitleWidget() {
    return const SizedBox(
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Hello, Samuel!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            children: [
              Icon(
                Icons.currency_pound_outlined,
                color: Color.fromRGBO(252, 208, 52, 1),
              ),
              Text(
                '+1600 Points',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(252, 208, 52, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
