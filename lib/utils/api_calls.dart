import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webart_technology_assessment/models/all_data_body.dart';
const String baseUrl="http://document.apibag.in:3001";
const String signupEndPoint="/v1/student";
const String loginEndPoint="/v1/student/login";
const String otpEndpoint="/v1/student/opt/verification";
class ApiCalls{
  var client=http.Client();


  //not used
  Future<dynamic> get(String link) async{
    var url=Uri.parse(link);
    // var _headers={
    //   'Authorization':'ngdgteh66356363',
    //   'api_key':"hgndgsnd9ng9ngd9",
    // };
    // var response= await client.get(url,headers: _headers);

    var response= await client.get(url);
    if(response.statusCode==200){
      return response.body;
    }else{
      print("error on get call in ApiCalls class, response.code=${response.statusCode}");
    }
  }
  Future<dynamic> post(String link,dynamic data) async{
    var url=Uri.parse(link);
    print(data.toString());
    var body=jsonEncode(data);
    print(body);
    var _headers={
      'Content-Type':'application/json',
    };
    var response= await client.post(url,headers: _headers,body: body);
    if(response.statusCode==200){
      // print(response.body);
      return response.body;
    }else{
      print("error on post call in ApiCalls class, response.code=${response.statusCode}");
    }
  }
  Future<dynamic> patch(String link,dynamic object) async{
    var url=Uri.parse(link);
    var body=jsonEncode(object);
    var _headers={
      'Content-Type':'application/json',
    };
    var response= await client.patch(url,body: body,headers: _headers);
    if(response.statusCode==200){
      return response.body;
    }else{
      print("error on patch call in ApiCalls class, response.code=${response.statusCode}");
    }
  }
}
class ConnectionToApi{
  Future<dynamic> login(String email,String password) async{
    var body=LoginBody(emailId: email,password: password);
    var response=await ApiCalls().post(baseUrl+loginEndPoint,body);
    var data=jsonDecode(response.toString());
    return data;
  }
  Future<dynamic> otp(String email,String password,String otp) async{
    var body=OtpBody(emailId: email,password: password,otp: otp);
    var response=await ApiCalls().patch(baseUrl+otpEndpoint,body,);
    var data=jsonDecode(response.toString());
    return data;
  }
  Future<dynamic> signup(String name,String email,String password) async{
    var body=SignupBody(name: name, emailId: email,password: password);
    var response=await ApiCalls().post(baseUrl+signupEndPoint,body);
    var data=jsonDecode(response.toString());
    return data;
  }
}