
import 'package:econestoga/model/add_jobs.dart';
import 'package:econestoga/service.dart';
import 'package:econestoga/utiles/const.dart';
import 'package:flutter/material.dart';

class DetailsScreenCa extends StatefulWidget {
  String? name;
  String? exp;
  String? dec;
  String? person;
   DetailsScreenCa({super.key, this.name,this.dec,this.exp,this.person});

  @override
  State<DetailsScreenCa> createState() => _DetailsScreenCaState();
}

class _DetailsScreenCaState extends State<DetailsScreenCa> {
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
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        children: [
          Text('${widget.person}',style: TextStyle(
              fontSize: 20,
              fontFamily: AppConstant.Latobold,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 10,),
          Text('${widget.name}',style: TextStyle(
              fontSize: 20,
              fontFamily: AppConstant.Latobold,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 3,),
          Text('Experience :- ${widget.exp}',style: TextStyle(
              fontSize: 16,
              fontFamily: AppConstant.Latomedium,
              fontWeight: FontWeight.w400
          ),),
          const SizedBox(height: 3,),
          const SizedBox(height: 10,),

          Text('Job Description',style: TextStyle(
              fontSize: 20,
              fontFamily: AppConstant.Latobold,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 3,),
          Text('${widget.dec}',style: TextStyle(
              fontSize: 14,
              fontFamily: AppConstant.Latomedium,
              fontWeight: FontWeight.w400
          ),),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () async {
              List<AddJobs> data = [
                AddJobs(
                    jobname: '${widget.person}',
                    jobdec: 'this work done by e and with less time',
                    jobcompanyname: 'assest/image/1.jpg',
                  jobtype: '1'
                ),
                AddJobs(
                    jobname: '${widget.person}',
                    jobdec: 'this work done by e and with less time',
                    jobcompanyname: 'assest/image/2.jpg',
                  jobtype: '1'
                ),
              ];
              List<AddJobs> data1 = [
                AddJobs(
                    jobname: '${widget.person}',
                    jobdec: 'this work done by e and with less time and get best work',
                    jobcompanyname: 'assest/image/3.jpg',
                  jobtype: '1'
                ),
                AddJobs(
                    jobname: '${widget.person}',
                    jobdec: 'this work done by e and with less time',
                    jobcompanyname: 'assest/image/4.jpg',
                  jobtype: '1'
                ),
              ];
              List<AddJobs> data2 = [
                AddJobs(
                    jobname: '${widget.person}',
                    jobdec: 'this work done by e and with less time',
                    jobcompanyname: 'assest/image/5.jpg',
                  jobtype: '1'
                ),
                AddJobs(
                    jobname: '${widget.person}',
                    jobdec: 'this work done by e and with less time',
                    jobcompanyname: 'assest/image/6.jpg',
                  jobtype: '1'
                ),
              ];
              Service.post.addAll( widget.person=='Pritesh'? data:widget.person=='Ravi'?data1:data2);
              await    Service().createPost(
                  addJobs: Service.post
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Connect Succesfully"),
                ),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:Theme.of(context).colorScheme.inversePrimary

              ),
              child: Center(
                child: Text('Connect',style: TextStyle(
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

