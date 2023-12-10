import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:sumaqwarmi2/src/models/productoModel.dart';

class CardPopular extends StatelessWidget {
  //final productosProvider = new ProductoProvider();
  final List<ProductoModel>productos;
  CardPopular({required this.productos});
  @override
  Widget build(BuildContext context) {
    final _screnSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context,int index){
          return Hero(
              tag: productos[index].idu!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  child: FadeInImage(
                    image: NetworkImage(productos[index].foto!),
                    placeholder: AssetImage('assets/placeholder.gif'),
                    fit: BoxFit.cover,
                  ),
                  onTap: (){
                   // Navigator.pushNamed(context, 'detalle',arguments: peliculas[index]);
                  },
                ),
              ));
        },
        itemCount: 3,
        itemWidth: _screnSize.width*0.85,
        itemHeight: _screnSize.height*0.50,
        //pagination: SwiperPagination(),
        //control: SwiperControl(),
      ),
    );
  }
}
