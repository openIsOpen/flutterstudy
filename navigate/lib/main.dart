
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title:'数据传递案例',
    home:ProductList(
      products:List.generate(
        20, 
        (i)=>Product('商品 $i','这是一个商品详情，编号为 $i')
        )
    )
  ));
}

/*
void main(){
  runApp(new MaterialApp(
    title:'navigate',
    home: new FirstScreen(),
  ));
}
*/

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
      appBar: AppBar(title:Text( 'The First Screen')),
      body:Center(
        child: RaisedButton(
          child:Text('查看商品详情界面'),
          onPressed:(){
            Navigator.push(context,new MaterialPageRoute(
              builder: (context) => new SecondScreen()
            ) );
          },
        ),
      )
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:Text('The Second Screen'),),
      body: Center(
        child:RaisedButton(
          child:Text('返回'),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
      ),
    );
  } 
}

class Product{
  final String title;
  final String description;
  Product(this.title,this.description);
}

class ProductList extends StatelessWidget{
  final List<Product> products;
  ProductList({Key key,@required this.products}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: new Text('商品列表'),),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title:Text(products[index].title),
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>new ProductDetail(product:products[index])
                )
                );
            },
          );
        },
      )
    );
  }
}

class ProductDetail extends StatelessWidget{
  final Product product;
  ProductDetail({Key key,@required this.product}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text('${product.title}')),
      body: Center(
        child: Text('${product.description}'),
      ),
    );
  }

}