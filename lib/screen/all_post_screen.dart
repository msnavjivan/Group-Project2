

import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:econestoga/service.dart';
import 'package:econestoga/utiles/const.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Service().getPost();
    print('-----');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TypewriterAnimatedTextKit(
          speed: const Duration(milliseconds: 100),
          text: const [
          'All Post',
          'Your Feed'
        ], textStyle: TextStyle(
            fontSize: 18,
            fontFamily: AppConstant.Latobold,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: Service.post.isEmpty?const SizedBox.shrink():ListView.builder(

        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        shrinkWrap: true,
        itemCount: Service.post.length,
        itemBuilder:
      (context, index) {
        return Card(
          child: Container(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${Service.post[index].jobname}',style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppConstant.Latobold,
                    fontWeight: FontWeight.bold
                ),),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  child:Service.post[index].jobtype=='1'? Image.asset(Service.post[index].jobcompanyname!,fit: BoxFit.fill,) : Image.file(File(Service.post[index].jobcompanyname!),fit: BoxFit.fill,),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('${Service.post[index].jobdec}',style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppConstant.Latomedium,
                    fontWeight: FontWeight.w500
                ),),
              ],
            ),
          ),
        );
      },
      ),
    );
  }
}

