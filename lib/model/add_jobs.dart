// To parse this JSON data, do
//
//     final addJobs = addJobsFromJson(jsonString);

import 'dart:convert';

List<AddJobs> addJobsFromJson(String str) => List<AddJobs>.from(json.decode(str).map((x) => AddJobs.fromJson(x)));

String addJobsToJson(List<AddJobs> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddJobs {
  String? jobname;
  String? jobcompanyname;
  String? jobtype;
  String? jobdec;

  AddJobs({
    this.jobname,
    this.jobcompanyname,
    this.jobtype,
    this.jobdec,
  });

  factory AddJobs.fromJson(Map<String, dynamic> json) => AddJobs(
    jobname: json["jobname"],
    jobcompanyname: json["jobcompanyname"],
    jobtype: json["jobtype"],
    jobdec: json["jobdec"],
  );

  Map<String, dynamic> toJson() => {
    "jobname": jobname,
    "jobcompanyname": jobcompanyname,
    "jobtype": jobtype,
    "jobdec": jobdec,
  };
}
