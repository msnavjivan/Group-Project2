
import 'package:econestoga/model/add_jobs.dart';
import 'package:econestoga/service.dart';
import 'package:econestoga/utiles/const.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  AddJobs? addJobs;
   DetailsScreen({super.key,this.addJobs});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Service().getApplyJobs();
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
          Text('${widget.addJobs?.jobname}',style: TextStyle(
              fontSize: 20,
              fontFamily: AppConstant.Latobold,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 3,),
          Text('${widget.addJobs?.jobcompanyname}',style: TextStyle(
              fontSize: 16,
              fontFamily: AppConstant.Latomedium,
              fontWeight: FontWeight.w400
          ),),
          const SizedBox(height: 3,),
          Text('${widget.addJobs?.jobtype}',style: TextStyle(
              fontSize: 14,
              fontFamily: AppConstant.Latomedium,
              fontWeight: FontWeight.w400
          ),),
          const SizedBox(height: 10,),

          Text('Job Description',style: TextStyle(
              fontSize: 20,
              fontFamily: AppConstant.Latobold,
              fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 3,),
          Text('${widget.addJobs?.jobdec}',style: TextStyle(
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
            onTap: (){
              Service.applyJobsList.add(widget.addJobs!);
              Service().applyJobs(applyJobs: Service.applyJobsList);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Save Jobs"),
                ),
              );


            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              decoration: BoxDecoration(
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
        ],
      ),
    );
  }
}
