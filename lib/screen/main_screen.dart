import 'package:econestoga/screen/all_post_screen.dart';
import 'package:econestoga/screen/candidates_screen.dart';
import 'package:econestoga/screen/create_post_screen.dart';
import 'package:econestoga/screen/job_screen.dart';
import 'package:econestoga/screen/your_job.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screen = [
    const PostScreen(),
    const CandidatesScreen(),
     CreatePostScreen(title: 'Create Post',),
    const YourJobs(),
    const JobScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed ,
        currentIndex: currentIndex,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: (i){
          currentIndex = i;
          setState(() {
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Post',
            icon:   Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Candidate',
            icon:  Icon(Icons.cable),
          ),
          BottomNavigationBarItem(
            label: 'Create Post',
            icon:  Icon(Icons.post_add),
          ),
          BottomNavigationBarItem(
            label: 'Save Post',
            icon:  Icon(Icons.save_as),
          ),
          BottomNavigationBarItem(
            label: 'Jobs',
            icon:  Icon(Icons.join_left_outlined),
          ),
        ],
      ),
    );
  }
}
