import 'package:education_app/Widget/Page1.dart';
import 'package:education_app/Widget/Page2.dart';
import 'package:education_app/Widget/Page3.dart';
import 'package:education_app/Widget/page4.dart';
import 'package:education_app/screens/course_details.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CourseList extends StatefulWidget {
  CourseList({super.key});

  final List<String> imageLists = [
    'https://as2.ftcdn.net/v2/jpg/06/20/08/81/1000_F_620088163_HoCsUBp8XxVgtIziReBVlU3KIhviGoOK.jpg',
    'https://as2.ftcdn.net/v2/jpg/06/21/38/81/1000_F_621388129_kc9sImZjillo7FZUP6MVYQsPMsyQFGf7.jpg',
    'https://as1.ftcdn.net/v2/jpg/06/37/05/16/1000_F_637051681_GQJW5aFAtsye7vwKTkHAqwhPp5s2dn1q.jpg',
    'https://as2.ftcdn.net/v2/jpg/03/83/25/83/1000_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
    'https://as2.ftcdn.net/v2/jpg/06/37/04/83/1000_F_637048304_gG1q9XoPsy17wtqm1rCM8ke3EjENcq5N.jpg',
    'https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
  ];

  final List<String> courses = [
    'All',
    'UI/UX',
    'Illustration',
    '3D Animation',
    'Development',
    'Profetional Courses'
  ];

  final controller = PageController();

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: ListView(
              itemExtent: 100,
              scrollDirection: Axis.horizontal,
              children: getImages(),
            ),
          ),
          getCourseHeaderWidget(),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getCourses(),
            ),
          ),
          GestureDetector(
            onTap: courseTapped,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                height: 440,
                child: PageView(
                  controller: widget.controller,
                  children: const [
                    Page1(),
                    Page2(),
                    Page3(),
                    Page4(),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: widget.controller,
              count: 4,
            ),
          ),
        ],
      ),
    );
  }

  Padding getCourseHeaderWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 10),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(fontSize: 18, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: 'Upcoming',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' course of  this week'),
          ],
        ),
      ),
    );
  }

  List<Widget> getImages() {
    List<Widget> list = [];
    for (String imageURL in widget.imageLists) {
      list.add(
        SizedBox(
          width: 90,
          height: 70,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                imageURL,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  List<Widget> getCourses() {
    List<Widget> list = [];
    for (int i = 0; i < widget.courses.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: i == 0
                  ? const Color.fromRGBO(236, 95, 95, 1)
                  : const Color.fromARGB(255, 238, 232, 232),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  widget.courses[i],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: i == 0 ? Colors.white : Colors.black87),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  void courseTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CourseDetails(),
      ),
    );
  }
}
