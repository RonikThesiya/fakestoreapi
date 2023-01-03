import 'package:fakestoreapi/screen/home/modal/ProductModal.dart';
import 'package:fakestoreapi/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {

    homeProvidertrue = Provider.of<HomeProvider>(context,listen: true);
    homeProviderfalse = Provider.of<HomeProvider>(context,listen: false);

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Fake Store"),
      ),
      body: FutureBuilder(
        future: homeProviderfalse!.apicall(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
              homeProvidertrue!.Productlist  = snapshot.data!;

              return GridView.builder(itemCount:homeProvidertrue!.Productlist.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 250,crossAxisCount: 2), itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){ 
                        Navigator.pushNamed(context, 'page',arguments: homeProviderfalse!.Productlist[index]);
                      },
                      child: Container(
                        color: Colors.blueGrey.shade50,
                        child: Column(
                          children: [
                            Image.network("${homeProvidertrue!.Productlist[index].image}",height: 150,),
                            Text("Price : \$${homeProvidertrue!.Productlist[index].price}"),
                            Text("Category : ${homeProvidertrue!.Productlist[index].category}"),
                            Text("Rate : ${homeProvidertrue!.Productlist[index].rating.rate}"),
                          ],
                        )
                      ),
                    ),
                  );
                }
              );
            }
          return Center(child: CircularProgressIndicator());
        },
      )
    ));
  }
}
