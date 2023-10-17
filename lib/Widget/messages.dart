import 'package:education_app/Data/message_data.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({super.key, required this.messagesList});
  final List<MessageData> messagesList;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            getSearchBar(),
            Expanded(
              child: ListView.builder(
                itemCount: widget.messagesList.length,
                itemBuilder: (context, index) {
                  var user = widget.messagesList[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: ClipOval(
                          child: Image.network(
                            width: 40,
                            height: 40,
                            user.profileImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          user.messages.last.message,
                          style: const TextStyle(
                            color: Color.fromRGBO(140, 140, 140, 1),
                            fontSize: 14,
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              user.messages.last.time,
                              style: const TextStyle(
                                color: Color.fromRGBO(199, 201, 217, 1),
                              ),
                            ),
                            user.unreadMessageCount() > 0
                                ? unreadMessageCount(user)
                                : const SizedBox()
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container unreadMessageCount(MessageData user) => Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(0, 130, 205, 1),
        ),
        alignment: Alignment.center,
        child: Text(
          '${user.unreadMessageCount()}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget getSearchBar() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      child: SearchBar(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => const Color.fromRGBO(247, 247, 250, 1),
        ),
        elevation: MaterialStateProperty.resolveWith((states) => 1),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        hintText: 'Search here',
        trailing: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(236, 95, 95, 1),
            ),
            width: 44,
            height: 44,
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 24,
            ),
          ),
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
            'My Messages',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            '2  new messages',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(252, 208, 52, 1),
            ),
          ),
        ],
      ),
    );
  }
}
