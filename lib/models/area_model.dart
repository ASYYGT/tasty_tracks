class AreaModel{
  dynamic strArea;
  AreaModel({this.strArea});
  factory AreaModel.fromJson(Map<String,dynamic> json){
    return AreaModel(strArea: json["strArea"]);
  }
  Map<String,dynamic> toJson()=>{"strArea":strArea};
}