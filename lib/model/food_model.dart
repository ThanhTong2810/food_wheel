class Food{
  final String id;
  final String imageUrl;
  final String name;
  final String address;

  Food({this.id, this.imageUrl, this.name, this.address});

  Food.fromJson(Map<dynamic,dynamic>json):
      id=json['id']??'',
      imageUrl=json['imageUrl']??'',
      name=json['name']??'',
      address=json['address']??'';

  Map<dynamic,dynamic> toJson()=>{
    'id':id??'',
    'imageUrl':imageUrl??'',
    'name':name??'',
    'address':address??'',
  };
}