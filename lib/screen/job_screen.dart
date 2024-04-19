import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:econestoga/model/add_jobs.dart';
import 'package:econestoga/screen/candidates_screen.dart';
import 'package:econestoga/screen/details_screen.dart';
import 'package:econestoga/screen/job_listing_screen.dart';
import 'package:econestoga/screen/your_job.dart';
import 'package:econestoga/service.dart';
import 'package:econestoga/utiles/const.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}


class _JobScreenState extends State<JobScreen>with SingleTickerProviderStateMixin {

  bool isPlaying = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<AddJobs> addJobs = [
  AddJobs(
    jobname: 'Senior Software Engineer',
    jobdec: 'We are looking for a talented software engineer to join our team. You will be responsible for developing and maintaining software solutions for our clients.',
    jobcompanyname: 'TechCorp',
    jobtype: 'Toronto, Canada'
  ),
  AddJobs(
    jobname: 'Web Developer',
    jobcompanyname: 'WebDesign Co',
    jobtype: 'Vancouver, Canada',
    jobdec: 'We are seeking a skilled web developer to design and develop responsive websites.'
  ),
  AddJobs(
    jobname: 'UX Designer',
    jobcompanyname: 'DesignSolutions LLC',
    jobtype: 'New York, USA',
    jobdec: 'We are looking for a creative UX designer to design user interfaces for web and mobile applications.'
  ),
  AddJobs(
    jobname: ': Data Scientist',
    jobcompanyname: 'Data Insights Co.',
    jobtype: 'San Francisco, USA',
    jobdec: 'We are seeking a data scientist to analyze large datasets and derive valuable insights.'
  ),
  AddJobs(
    jobname: 'Product Manager',
    jobcompanyname: 'TechStart Inc.',
    jobtype: 'Seattle, USA',
    jobdec: 'We are looking for a strategic product manager to lead product development efforts and define product strategy.'
  ),
  AddJobs(
    jobname: 'Mobile Developer',
    jobcompanyname: 'AppSolutions LLC',
    jobtype: 'Miami, USA',
    jobdec: 'We are seeking a mobile developer to develop and maintain mobile applications for iOS and Android platforms.'
  ),
  AddJobs(
    jobname: 'Marketing Manager',
    jobcompanyname: 'DigitalMarketing Co.',
    jobtype: 'Chicago, USA',
    jobdec: 'We are looking for a results-driven marketing manager to develop and implement digital marketing strategies.'
  ),
  AddJobs(
    jobname: 'IT Consultant',
    jobcompanyname: 'TechConsulting Ltd.',
    jobtype: 'London, UK',
    jobdec: 'We are seeking an experienced IT consultant to provide IT consulting services to clients.'
  ),
  AddJobs(
    jobname: 'Graphic Designer',
    jobcompanyname: 'DesignStudio',
    jobtype: 'Madrid, Spain',
    jobdec: 'We are looking for a creative graphic designer to design marketing materials and branding assets. '
  ),
  AddJobs(
    jobname: 'AI Engineer',
    jobcompanyname: 'AI Solutions Co.',
    jobtype: 'Tokyo, Japan',
    jobdec: 'We are seeking an AI engineer to develop machine learning models for various applications.'
  )
];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //box.remove('jobs');
   Service().getJobs();

  }


  List page = [
    'Candidates',
    'Create Post',
    'Your Job',
  ];

List<Widget> screen = [
  const CandidatesScreen(),
  const JobListingScreen(),
  const YourJobs(),
];
final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   key:_scaffoldKey ,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title:TypewriterAnimatedTextKit(
        speed: const Duration(milliseconds: 100),
        text: const [
          'Job Feed',
          'Jobs for you'
        ], textStyle: TextStyle(
          fontSize: 18,
          fontFamily: AppConstant.Latobold,
          fontWeight: FontWeight.bold
      ),),
      ),
      /*drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(icon: const Icon(
                    Icons.arrow_forward_ios_sharp
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  )
                ],
            ),
            const SizedBox(
              height: 25,
            ),
            ListView.separated(
              itemCount: page.length+1,
              shrinkWrap: true,
              itemBuilder:
            (context, index) {
             if(index==page.length){
               return const SizedBox.shrink();
             }else{
               return InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => screen[index],));
               _scaffoldKey.currentState?.closeDrawer();
                 },
                 child: Container(
                   padding: const EdgeInsets.symmetric(vertical: 3),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('${page[index]}',style: TextStyle(
                           fontSize: 18,
                           fontFamily: AppConstant.Latobold,
                           fontWeight: FontWeight.bold
                       ),),
                       const Icon(
                         Icons.arrow_forward_ios_sharp,
                         size: 18,
                       )
                     ],
                   ),
                 ),
               );
             }
            }, separatorBuilder: (BuildContext context, int index) {
              if(index==page.length){
                return const SizedBox.shrink();
              }else{
                return const Divider(
                  color: Colors.black12,
                );
              }
            },
            )
          ],
        ),
      ),*/
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        children: [
          addJobs.isNotEmpty?  ListView.separated(
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           itemCount: addJobs.length,
           itemBuilder: (context, index) {
             return GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailsScreen(addJobs: addJobs[index],),));
               },
               child: Card(
                 color: Colors.white,
                 child: Container(
                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                       border: Border.all(
                         color: Colors.black.withOpacity(0.1),
                       )
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: MediaQuery.of(context).size.width*0.5,
                             child: Text('${addJobs[index].jobname}',style: TextStyle(
                                 fontSize: 20,
                                 fontFamily: AppConstant.Latobold,
                                 fontWeight: FontWeight.bold
                             ),),
                           ),
                           Icon(Icons.block,color: Colors.black.withOpacity(0.6),)
                         ],
                       ),
                       const SizedBox(
                         height: 4,
                       ),
                       SizedBox(
                         width: MediaQuery.of(context).size.width*0.4,
                         child: Text('${addJobs[index].jobcompanyname}',style: TextStyle(
                             fontSize: 16,
                             fontFamily: AppConstant.Latomedium,
                             fontWeight: FontWeight.w400
                         ),),
                       ),
                       const SizedBox(
                         height: 4,
                       ),
                       Text('${addJobs[index].jobtype}',style: TextStyle(
                           fontSize: 14,
                           fontFamily: AppConstant.Latomedium,
                           fontWeight: FontWeight.w400
                       ),),
                     ],
                   ),
                 ),
               ),
             );
           }, separatorBuilder: (BuildContext context, int index) {
           return const SizedBox(height: 10,);
         },) :const SizedBox.shrink()
        ],
      ),
    );
  }
}
