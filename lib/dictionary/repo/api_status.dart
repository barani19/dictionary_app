class Success{
  int code;
  Object response;
  Success({required this.code,required this.response});
}

class Failure{
  int code;
  Object errormessage;
  Failure({required this.code,required this.errormessage});
}