import 'package:coffee_delivery/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreeneState();
}

class _HomeScreeneState extends State<HomeScreen> {
  List coffeeTypes = [
    {
      'id': 0,
      'name': 'Cappuccino',
    },
    {
      'id': 1,
      'name': 'Latte',
    },
    {
      'id': 3,
      'name': 'Americano',
    },
    {
      'id': 4,
      'name': 'Espresso',
    },
    {
      'id': 5,
      'name': 'Flat White',
    }
  ];
  int selectedType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.backgroundColor,
      body: Column(
        children: [
          SizedBox(height: 50),
          profileWidget(),
          SizedBox(height: 10),
          searchForm(),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                // /left selected types widget
                Container(
                  width: 40,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: CoreColor.leftTabColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: coffeeTypes.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedType = coffeeTypes[index]['id'];
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              '${coffeeTypes[index]['name']}',
                              style: GoogleFonts.rosario(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: CoreColor.buttonColor.withValues(
                                  alpha:
                                      selectedType == coffeeTypes[index]['id']
                                          ? 1
                                          : 0.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                // /add coffee list
                SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: GridView.custom(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7 //size heigth
                        ),
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: CoreColor.cardColor,
                              borderRadius: BorderRadius.circular(13)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Image.asset("assets/images/img1.png"),
                                  Container(
                                    width: 60,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: CoreColor.moneyBgColor
                                            .withValues(alpha: 0.5),
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(12),
                                        )),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.star,
                                          color: CoreColor.starColor,
                                          size: 15,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '4.5',
                                          style: GoogleFonts.rosario(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Drizzled with Caramel',
                                style: GoogleFonts.rosario(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: CoreColor.fromHex('414141')
                                      .withValues(alpha: 0.5),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '\$ 99',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight:
                                              FontWeight.bold, //semi  bold
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 39,
                                      height: 39,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: CoreColor.buttonColor,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: CoreColor.backgroundColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget searchForm() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: CoreColor.formColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          hintText: 'Browse your favourite coffee...',
          hintStyle: GoogleFonts.rosario(
            fontSize: 15,
            color: CoreColor.buttonColor.withValues(alpha: 0.3),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
            color: CoreColor.buttonColor.withValues(alpha: 0.3),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget profileWidget() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'déjà',
                style: GoogleFonts.rosario(
                    fontSize: 36,
                    color: CoreColor.buttonColor
                        .withValues(alpha: 0.5) //add opacity
                    ),
              ),
              Text(
                'Brew',
                style: GoogleFonts.rosario(
                  color: CoreColor.buttonColor,
                  fontSize: 48,
                ),
              )
            ],
          ),
          Image.asset(
            'assets/images/profile.png',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
