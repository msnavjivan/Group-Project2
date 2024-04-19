
import 'package:econestoga/model/add_jobs.dart';
import 'package:get_storage/get_storage.dart';

class Service{
  final box = GetStorage();
 static List<AddJobs> jobsList = [];
 static List<AddJobs> applyJobsList = [];
 static List<AddJobs> post = [];
  createJob({List<AddJobs>? addJobs}){
    box.write('jobs',addJobsToJson(addJobs!));
  }
  getJobs(){
    if(box.read('jobs') != null){
      jobsList.addAll(addJobsFromJson(box.read('jobs')));
    }}

  getApplyJobs(){

    applyJobsList.clear();
    if(box.read('applyJobs') != null){
      applyJobsList.addAll(addJobsFromJson(box.read('applyJobs')));

    }
  }
  applyJobs({List<AddJobs>? applyJobs}){
    box.write('applyJobs',addJobsToJson(applyJobs!));
  }
  createPost({List<AddJobs>? addJobs}){
    box.write('post',addJobsToJson(addJobs!));
  }

  getPost(){
    post.clear();
    if(box.read('post') != null){
      post.addAll(addJobsFromJson(box.read('post')));
      print('-----a');
    }
  }
}