
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProductDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print("data: $data");
    print("review: ${data['review']}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Details Screen"),
      ),
      body: Column(
        children: [
          Text(data["name"],style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 1,),
          Text(data["description"],style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
          Text("Price: ${data["price"]}",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
          Text("Stock: ${data["stock"]}",style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w500),),
          Expanded(
              child: ListView.builder(
                itemCount: data["review"].length,
                  itemBuilder: (context, index) {
                  final review=data["review"][index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //height: 30,
                        color: Colors.red,
                        child: Column(
                          children: [
                            Text("User: ${review['user']['username']}"),
                            Text("Comment: ${review['comment']}"),
                            Text("Rating: ${review['rating']}"),
                          ],
                        ),
                      ),
                    );
                  },
              )
          )
        ],
      ),
    );
  }

}