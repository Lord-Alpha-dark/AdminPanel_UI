
class Brand{
  String? name;
  SubCategoryId? subcategoryId;
  String? createdAt;
  String? updatedAt;
  String? sId;
  
   Brand({this.sId, this.name, this.subcategoryId, this.createdAt, this.updatedAt});

   Brand.fromJson(Map<String,dynamic> json)
   {
     sId=json['_id'];
     name=json['name'];
     subcategoryId=json['subCategory']!=null?
      SubCategoryId.fromJson(json['subCategory']): null;
      createdAt=json['createdAt'];
      updatedAt=json['updatedAt'];
   }

   Map<String,dynamic> toJson(){
    Map<String,dynamic> data={};
    data['_id']=sId;
    data['name']=name;
    if(subcategoryId!=null)
    {
      data['subCategory']=subcategoryId!.toJson();
    }
     data['createdAt'] = createdAt;
    data['updatedAt'] =  updatedAt;
    return data;
   }
}

class SubCategoryId{
  String? name;
  String? sId;
  
   SubCategoryId({this.sId, this.name});

   SubCategoryId.fromJson(Map<String,dynamic> json)
   {
     sId = json['_id'];
    name = json['name'];
   }

   Map<String,dynamic> toJson(){
    Map<String,dynamic> data={};
    data['_id']=sId;
    data['name']=name;
    return data;
   }
}