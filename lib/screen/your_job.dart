import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:econestoga/service.dart';
import 'package:econestoga/utiles/const.dart';
import 'package:flutter/material.dart';

class YourJobs extends StatefulWidget {
  const YourJobs({super.key});

  @override
  State<YourJobs> createState() => _YourJobsState();
}

class _YourJobsState extends State<YourJobs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //box.remove('jobs');
    Service().getApplyJobs();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TypewriterAnimatedTextKit(
          speed: const Duration(milliseconds: 100),
          text: const [
            'Your Jobs',
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
            height: 12,
          ),
          Service.applyJobsList.isNotEmpty?  ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Service.applyJobsList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
               //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailsScreen(addJobs: Service.jobsList[index],),));
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
                            Container(
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Text('${Service.applyJobsList[index].jobname}',style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: AppConstant.Latobold,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                            GestureDetector(
                              onTap: () async {
                                Service.applyJobsList.removeAt(index);
                             await   Service().applyJobs(applyJobs: Service.applyJobsList);
                                await   Service().getApplyJobs();
                                setState(() {

                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Delete Succesfully"),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black
                                ),
                                child: Center(
                                  child:Text('Delete',style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppConstant.Latomedium,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400
                                  ),) ,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Text('${Service.applyJobsList[index].jobcompanyname}',style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppConstant.Latomedium,
                              fontWeight: FontWeight.w400
                          ),),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('${Service.applyJobsList[index].jobtype}',style: TextStyle(
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
