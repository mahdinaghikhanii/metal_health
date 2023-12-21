import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metal_health/pages/home/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: loading == true
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 35,
                            height: 35,
                            decoration: const ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/mahdi.jpg'),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(
                                  width: 4,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Color(0x77F09E54),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Stack(
                            children: [
                              const Icon(Icons.notifications_outlined,
                                  size: 35),
                              Positioned(
                                right: -3,
                                top: -2,
                                child: Container(
                                  width: 21,
                                  height: 21,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xFFFE8235),
                                    shape: OvalBorder(),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
        ),
        body: loading == true
            ? const Center(
                child: CircularProgressIndicator(color: Colors.green))
            : SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _goodAfterNoon(),
                      feelingToday(context),
                      textAboutDay(context),
                      _planExpired(context),
                      const SizedBox(height: 40)
                    ]),
              ));
  }
}

Widget _goodAfterNoon() {
  return Container(
    margin: const EdgeInsets.only(left: 20, bottom: 26, right: 20, top: 20),
    width: 235,
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Good Afternoon',
            style: GoogleFonts.getFont('Epilogue').copyWith(
              color: const Color(0xFF371B34),
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: ', ',
            style: GoogleFonts.getFont('Epilogue').copyWith(
              color: const Color(0xFF371B34),
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: 'Sarina!',
            style: GoogleFonts.getFont('Epilogue').copyWith(
              color: const Color(0xFF371B34),
              fontSize: 26,
              fontFamily: 'Epilogue',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget feelingToday(context) {
  return Column(children: [
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Text(
        'How are you feeling today ?',
        style: GoogleFonts.getFont('Epilogue').copyWith(
          color: const Color(0xFF371B34),
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    SizedBox(
      height: 90,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
          itemCount: homeModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(children: [
              Container(
                margin: const EdgeInsets.only(right: 0, left: 24),
                width: 59.20,
                height: 62.06,
                decoration: ShapeDecoration(
                  color: homeModel[index].color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(homeModel[index].addressIcon),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 9),
                child: Text(
                  homeModel[index].title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Epilogue').copyWith(
                    color: const Color(0xFF371B34),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ]);
          }),
    ),
    const SizedBox(height: 26),
    Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Image.asset('assets/sessions.png')),
    const SizedBox(height: 26),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 62,
              decoration: ShapeDecoration(
                color: const Color(0xFFF4F3F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.pages, color: Color(0xFFD6CCC6)),
                    const Padding(padding: EdgeInsets.only(left: 16)),
                    Text('Journal',
                        style: GoogleFonts.getFont('Epilogue').copyWith(
                          color: const Color(0xFF573926),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ))
                  ]),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
                height: 62,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF4F3F1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.book, color: Color(0xFFD6CCC6)),
                      const Padding(padding: EdgeInsets.only(left: 16)),
                      Text('Library',
                          style: GoogleFonts.getFont('Epilogue').copyWith(
                            color: const Color(0xFF573926),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ))
                    ])),
          )
        ],
      ),
    )
  ]);
}

Widget textAboutDay(context) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.sizeOf(context).width,
      height: 79,
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F6F6),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFF4F4F4),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Center(
        child: Text(
            '“It is better to conquer yourself than\n to win a thousand battles”',
            style: GoogleFonts.getFont('Epilogue').copyWith(
              color: const Color(0xFF6F6F6F),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
      ));
}

Widget _planExpired(context) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.sizeOf(context).width,
      child: Image.asset('assets/pan.png'));
}
