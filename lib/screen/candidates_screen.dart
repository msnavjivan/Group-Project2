
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:econestoga/screen/candinate_details_screen.dart';
import 'package:econestoga/utiles/const.dart';
import 'package:flutter/material.dart';

class CandidatesScreen extends StatefulWidget {
  const CandidatesScreen({super.key});

  @override
  State<CandidatesScreen> createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  List<Candidate> candidate = [
    Candidate(
      name: 'Pritesh',
      data: Data(
        name: 'Flutter Developer',
        experience: '1',
        dec: 'Flutter developer with all experience'
      )
    ),
    Candidate(
      name: 'Ravi',
      data: Data(
        name: 'Android Developer',
        experience: '1',
        dec: 'Android developer with all experience'
      )
    ),
    Candidate(
      name: 'Mitesh',
      data: Data(
        name: 'UI/UX Designer',
        experience: '1',
        dec: 'UI/UX Designer with all experience'
      )
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TypewriterAnimatedTextKit(
          speed: const Duration(milliseconds: 100),
          text: const [
            'Candidates',
            'Connect With Connection'
          ], textStyle: TextStyle(
            fontSize: 18,
            fontFamily: AppConstant.Latobold,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        shrinkWrap: true,
        itemCount: candidate.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreenCa(
                name: candidate[index].data?.name,
                dec: candidate[index].data?.dec,
                exp: candidate[index].data?.experience,
                person: candidate[index].name,
              )));
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.4,
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black12
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${candidate[index].name}',style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppConstant.Latomedium,
                      fontWeight: FontWeight.w500
                  )),
                  const Icon(Icons.arrow_forward_ios_sharp,size: 18,)
                ],
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10,);
      },
      ),
    );
  }
}



//List<Candidate> candidateFromJson(String str) => List<Candidate>.from(json.decode(str).map((x) => Candidate.fromJson(x)));

//String candidateToJson(List<Candidate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Candidate {
  String? name;
  Data? data;

  Candidate({
    this.name,
    this.data,
  });
}

class Data {
  String? experience;
  String? dec;
  String? name;

  Data({
    this.experience,
    this.dec,
    this.name,
  });
}
