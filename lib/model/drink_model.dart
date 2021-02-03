class Drink{
  final String id;
  final String imageUrl;
  final String name;
  final String address;

  Drink({this.id, this.imageUrl, this.name, this.address});

  Drink.fromJson(Map<dynamic,dynamic>json):
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