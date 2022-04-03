import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  _renderHeader() {
    return (Column(children: [
      Text("Total Balance", style: TextStyle(fontSize: 18)),
      SizedBox(height: 10.0),
      RichText(
        text: TextSpan(
          text: '73239.99 ',
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          children: const <TextSpan>[
            TextSpan(
                text: 'JOD',
                style: TextStyle(fontSize: 12, color: Color.fromRGBO(181, 181, 181, 1)))
          ],
        ),
      )
    ]));
  }

  _renderCard(int index) {
    return Column(children: [
      _renderHeader(),
      SizedBox(height: 30),
      Container(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.grey,
            child: Center(
              child: Text("$index"),
            ),
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final customLayoutOption = CustomLayoutOption(startIndex: -1, stateCount: 3);
    customLayoutOption.addRotate([-10.0 / 180, 00.0, 10.0 / 180]);
    customLayoutOption
        .addTranslate([Offset(-310.0, -15.0), Offset(0.0, 0.0), Offset(310.0, -15.0)]);

    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Swiper(
        itemBuilder: (BuildContext context, int index) => _renderCard(index),
        itemCount: 3,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: Colors.black, size: 5, activeSize: 7, color: Colors.grey)),
        itemWidth: MediaQuery.of(context).size.width * 0.7,
        itemHeight: MediaQuery.of(context).size.height * 0.7,
        layout: SwiperLayout.CUSTOM,
        customLayoutOption: customLayoutOption,
      ))),
    );
  }
}
