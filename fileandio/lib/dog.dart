class Dog{
  final int id;
  final String name;
  final int age;

  Dog({this.id,this.name,this.age});

  Map<String,dynamic> toMap(){
    return{
      "id":this.id,
      "name":this.name,
      "age":this.age
    };
  }
}