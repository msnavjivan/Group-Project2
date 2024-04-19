

import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:econestoga/model/add_jobs.dart';
import 'package:econestoga/service.dart';
import 'package:econestoga/utiles/const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  String? title;
   CreatePostScreen({super.key,this.title});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController tile = TextEditingController();
  TextEditingController dec = TextEditingController();

  bool? isSelect;
  File? image;
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
            'Create Post',
            'Share Your Idea'
          ], textStyle: TextStyle(
            fontSize: 18,
            fontFamily: AppConstant.Latobold,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 16,
          ),
          EditTextUtils().getCustomEditTextArea(
              labelValue: 'Enter Name',
              hintValue: 'Enter Title',
              validation: true,
              controller: tile,
              keyboardType: TextInputType.name,
              textStyle: TextStyle(
                fontFamily: AppConstant.Latobold,
                fontSize: 14,

              ),
              validationErrorMsg: 'error_msg'),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if(image == null) return;

              final imageTemp = File(image.path);
              setState(() => this.image = imageTemp);

            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.3,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                image: DecorationImage(image: FileImage(image??File('')),fit: BoxFit.fill)
              ),
              child: image !=null? const SizedBox.shrink() : const Center(
                child: Icon(Icons.add,size: 50,),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          EditTextUtils().getCustomEditTextArea(
              labelValue: 'Enter Name',
              hintValue: 'Enter description',
              validation: true,
              controller: dec,
              length: 5,
              keyboardType: TextInputType.name,
              textStyle: TextStyle(
                fontFamily: AppConstant.Latobold,
                fontSize: 14,

              ),
              validationErrorMsg: 'error_msg'),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () async {

              if(tile.text.isNotEmpty && dec.text.isNotEmpty && image != null){
                AddJobs a = AddJobs(
                    jobname: tile.text,
                    jobdec: dec.text,
                    jobcompanyname: image?.path
                );
                Service.post.add(a);
                await    Service().createPost(
                    addJobs: Service.post
                );
                image==null;
                tile.clear();
                dec.clear();
                setState(() {

                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Post Create"),
                  ),
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("All Fields Required"),
                  ),
                );
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                  color:Theme.of(context).colorScheme.inversePrimary

              ),
              child: Center(
                child: Text('Create Post',style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppConstant.Latomedium,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

}


class EditTextUtils {
  Widget getCustomEditTextArea(
      {String labelValue = "",
        String hintValue = "",
        bool? validation,
        int? length ,
        TextEditingController? controller,
        TextInputType keyboardType = TextInputType.text,
        TextStyle? textStyle,
        String? validationErrorMsg}) {
    Widget textFormField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(hintValue,style: TextStyle(
        fontSize: 14,
        fontFamily: AppConstant.Latobold,
        fontWeight: FontWeight.bold
    ),),
        const SizedBox(
          height: 5,
        ),
        Container(
          height:length==null? 50:100,
          padding: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            keyboardType: keyboardType,
            style: textStyle,
            controller: controller,
            maxLines:length??1 ,
            validator: (String? value) {
              if (validation==true) {
                if (value?.isEmpty==true) {
                  return validationErrorMsg;
                }else{
                  return null;
                }
              }
              return null;
            },
            decoration: InputDecoration(
              //  labelText: labelValue,
                contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                hintText: hintValue,
                labelStyle: textStyle,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          ),
        )
      ],
    );
    return textFormField;
  }

}
