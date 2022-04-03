import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  _renderHeader() {
    return Column(children: [
      SizedBox(height: 50.0),
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
    ]);
  }

  _renderCard(int index) {
    TextStyle textWhiteBold = DefaultTextStyle.of(context)
        .style
        .copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    TextStyle textBlackBold = DefaultTextStyle.of(context)
        .style
        .copyWith(color: Colors.black, fontWeight: FontWeight.bold);
    TextStyle textGreyMedium = DefaultTextStyle.of(context)
        .style
        .copyWith(color: Colors.grey[800], fontWeight: FontWeight.w500);

    return Container(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: index != 0
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                              Color.fromRGBO(175, 52, 130, 1),
                              Color.fromRGBO(219, 102, 65, 1)
                            ])
                      : null),
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Text(index == 0 ? "My Account" : "My Credit Card",
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(color: index == 0 ? Colors.black : Colors.white)),
                  index == 2 ? Spacer() : Container(),
                  index == 2 ? Image.asset('assets/signal.png', height: 15, width: 15) : Container()
                ]),
                SizedBox(height: 15.0),
                Image.asset('assets/digibanc.png', height: 30),
                SizedBox(height: 20.0),
                Text("Omar mansur",
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(color: index == 0 ? Colors.black : Colors.white)),
                SizedBox(height: 10.0),
                index != 0
                    ? Text("..... 8812",
                        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.white))
                    : Container(),
                SizedBox(height: 20.0),
                index == 0
                    ? Column(children: [
                        RichText(
                          text: TextSpan(
                            text: '7896.99 ',
                            style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: index == 0 ? Colors.black : Colors.white),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'JOD',
                                  style: TextStyle(
                                      fontSize: 12, color: Color.fromRGBO(181, 181, 181, 1)))
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text("Available Balance", style: textGreyMedium),
                      ])
                    : Container(),
                SizedBox(height: 20.0),
                index == 0
                    ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Text("8451 1353 1245 3421", style: textBlackBold),
                          SizedBox(width: 10.0),
                          InkWell(onTap: () {}, child: Image.asset('assets/copy.png', height: 20))
                        ]),
                        SizedBox(height: 10.0),
                        Text("ACCOUNT NUMBER",
                            style: DefaultTextStyle.of(context)
                                .style
                                .copyWith(color: Colors.grey[800], fontWeight: FontWeight.w500)),
                      ])
                    : Container(),
                SizedBox(height: 20.0),
                index == 0
                    ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(children: [
                          Flexible(
                              child: Text(
                            "JOD120315314513451341234567312",
                            style: textBlackBold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          )),
                          SizedBox(width: 10.0),
                          InkWell(onTap: () {}, child: Image.asset('assets/copy.png', height: 20))
                        ]),
                        SizedBox(height: 10.0),
                        Text("IBAN",
                            style: DefaultTextStyle.of(context)
                                .style
                                .copyWith(color: Colors.grey[800], fontWeight: FontWeight.w500)),
                      ])
                    : Container(),
                SizedBox(height: 10.0),
              ])),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final customLayoutOption = CustomLayoutOption(startIndex: -1, stateCount: 3);
    customLayoutOption.addRotate([-10.0 / 180, 00.0, 10.0 / 180]);
    customLayoutOption
        .addTranslate([Offset(-310.0, -15.0), Offset(0.0, 0.0), Offset(310.0, -15.0)]);

    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: _renderHeader()),
        SliverFillRemaining(
            child: Swiper(
          itemBuilder: (BuildContext context, int index) => _renderCard(index),
          itemCount: 3,
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.black, size: 5, activeSize: 7, color: Colors.grey)),
          itemWidth: MediaQuery.of(context).size.width * 0.7,
          itemHeight: MediaQuery.of(context).size.height * 0.6,
          layout: SwiperLayout.CUSTOM,
          customLayoutOption: customLayoutOption,
        ))
      ])),
    );
  }
}
