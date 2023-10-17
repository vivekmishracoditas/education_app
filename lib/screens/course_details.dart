import 'package:education_app/Widget/video_player.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVideoPlayerWidget(),
            getStepDesignHeaderWidget(),
            getCourseLabels(),
            getCourseDescriptions(),
            getProfileDetails(),
            getBottomPlayDetails(),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 30),
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(236, 95, 95, 1),
          onPressed: () {
            showFollowBottomSheet(context);
          },
          child: const Text(
            'Follow class',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showFollowBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.84,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(196, 196, 196, 1),
                  ),
                  width: 80,
                  height: 8,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 32, right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Available time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Adjust to your schedule',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(140, 140, 140, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: Image.asset('lib/assets/CTA_Small_Icon.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 32),
              child: Column(
                children: [
                  getAllRow(),
                  getAllRow(),
                  getAllRow(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 5),
              child: Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(246, 247, 250, 1),
                  border: InputBorder.none,
                  filled: true,
                  label: Text('Email'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Telp Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(246, 247, 250, 1),
                  border: InputBorder.none,
                  filled: true,
                  label: Text('Phone Number'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Schedule date & time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(236, 95, 95, 0.40),
                          ),
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          child: const Icon(
                            Icons.check,
                            color: Color.fromRGBO(236, 95, 95, 1),
                            size: 12,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            '12 October, 2020 at 09.45 AM',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(157, 159, 160, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(236, 95, 95, 1),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomePage(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getAllRow() {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          getAllContainer(),
          getAllContainer(),
          getAllContainer(),
        ],
      ),
    );
  }

  Widget getAllContainer() {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 95, 95, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 48,
      height: 41,
      child: const Center(
        child: Text(
          'All',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Padding getBottomPlayDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: const Color.fromRGBO(246, 247, 250, 1),
        height: 83,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/BaseBackground.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 67,
                height: 67,
                child: Image.asset('lib/assets/play-arrow.png'),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How to get feedback on their products in just 5 days',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('04:10 m'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container getProfileDetails() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://media.istockphoto.com/id/490483300/photo/portrait-of-beautiful-blonde-woman-with-curly-hairstyle.webp?s=2048x2048&w=is&k=20&c=VvrGxzOl9ZZQrIpyChu8jl8F1S-PB0rstE7ht1JS11M=',
                  fit: BoxFit.fill,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Laurel Seilha',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Product Designer',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.alarm,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      '5h 21m',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(252, 204, 117, 1),
                  ),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: const Text(
                    'Free e-book',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding getCourseDescriptions() {
    return const Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        'In this course I\'ll show the step by step, day by day process to build better products, just as Google, Slack, KLM and manu other do.',
        style: TextStyle(
          color: Color.fromRGBO(157, 159, 160, 1),
        ),
      ),
    );
  }

  Padding getCourseLabels() {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(77, 201, 209, 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                child: Text(
                  '6 lessions',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 130, 205, 1),
                  borderRadius: BorderRadius.circular(5)),
              child: const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                  child: Text(
                    'UI/UX',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(141, 94, 242, 1),
                  borderRadius: BorderRadius.circular(5)),
              child: const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                  child: Text(
                    'Free',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding getStepDesignHeaderWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        'Step design sprint for beginner',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  SizedBox getVideoPlayerWidget() {
    return SizedBox(
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: const VideoPlayerWidget(
            videoURL:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Color.fromRGBO(236, 95, 95, 1),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Course Details',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(
            Icons.favorite_border,
            color: Color.fromRGBO(236, 95, 95, 1),
          ),
        )
      ],
    );
  }
}
