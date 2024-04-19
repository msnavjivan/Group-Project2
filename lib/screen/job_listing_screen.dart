
import 'package:econestoga/model/add_jobs.dart';
import 'package:econestoga/screen/create_post_screen.dart';
import 'package:econestoga/service.dart';
import 'package:econestoga/utiles/const.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class JobListingScreen extends StatefulWidget {
  const JobListingScreen({super.key});

  @override
  State<JobListingScreen> createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  TextEditingController jobName = TextEditingController();
  TextEditingController jobType = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController jobDesc = TextEditingController();
  final box = GetStorage();
  List<AddJobs> jobs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   if(box.read('jobs') != null){
     jobs.addAll(addJobsFromJson(box.read('jobs')));
   }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Job Listing',style: TextStyle(
            fontSize: 18,
            fontFamily: AppConstant.Latobold,
            fontWeight: FontWeight.bold
        ),),
        elevation: 0,

      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        children: [
          EditTextUtils().getCustomEditTextArea(
              labelValue: 'Enter Name',
              hintValue: 'Enter Job Name',
              validation: true,
              controller: jobName,
              keyboardType: TextInputType.name,
              textStyle: TextStyle(
                fontFamily: AppConstant.Latobold,
                fontSize: 14,

              ),
              validationErrorMsg: 'error_msg'),
          EditTextUtils().getCustomEditTextArea(
              labelValue: 'Enter Name',
              hintValue: 'Enter Company Name',
              validation: true,
              controller: companyName,
              keyboardType: TextInputType.name,
              textStyle: TextStyle(
                fontFamily: AppConstant.Latobold,
                fontSize: 14,

              ),
              validationErrorMsg: 'error_msg'),
          EditTextUtils().getCustomEditTextArea(
              labelValue: 'Enter Name',
              hintValue: 'Enter Job Type',
              validation: true,
              controller: jobType,
              keyboardType: TextInputType.name,
              textStyle: TextStyle(
                fontFamily: AppConstant.Latobold,
                fontSize: 14,

              ),
              validationErrorMsg: 'error_msg'),
          EditTextUtils().getCustomEditTextArea(
              labelValue: 'Enter Name',
              hintValue: 'Enter Job Desription',
              validation: true,
              length: 5,
              controller: jobDesc,
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
              AddJobs a = AddJobs(
                  jobname: jobName.text,
                  jobdec: jobDesc.text,
                  jobcompanyname: jobDesc.text,
                  jobtype: jobType.text
              );
              jobs.add(a);
              Service().createJob(
                addJobs: jobs
              );
            await  Service().getJobs();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              decoration: BoxDecoration(
                  color:Theme.of(context).colorScheme.inversePrimary

              ),
              child: Center(
                child: Text('Apply Now',style: TextStyle(
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
