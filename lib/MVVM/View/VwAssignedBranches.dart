import 'package:customercare/MVVM/ViewModel/VmAssignedBranches.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class VwAssignedBranches extends StatefulWidget {
  const VwAssignedBranches({Key? key}) : super(key: key);

  @override
  State<VwAssignedBranches> createState() => _VwAssignedBranchesState();
}

class _VwAssignedBranchesState extends State<VwAssignedBranches> {
  @override
  final l_VmAssignedBranches = Get.put(VmAssignedBranches());

  void initState() {
    // TODO: implement initState
    super.initState();
    l_VmAssignedBranches.Fnc_addItem();
  }
  //UserWidgets

  Widget build(BuildContext context) {
    Widget _WidgetportraitMode(double Pr_height, Pr_width) {
      return Scaffold(
        bottomNavigationBar: SizedBox(
            height: 33,
            child: BottomAppBar(
              elevation: 10.0,
              color: Colors.cyan.shade200,
              child: Stack(
                children: [
                  Container(
                    height: Pr_height * .100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: Pr_height * 0),
                    child: IconButton(
                      icon: Icon(
                        MdiIcons.whatsapp,
                        size: 20,
                        color: Colors.green,
                      ),
                      onPressed: () async {
                        var whatsapp = "+923214457734";
                        Uri whatsappopen =
                            Uri.parse("whatsapp://send?phone=$whatsapp");
                        if (await launchUrl(whatsappopen)) {
                          //dialer opened
                        } else {
                          //dailer is not opened
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Pr_height * 0.00,
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () => launchUrl(
                            Uri.parse('https://www.aisonesystems.com/')),
                        child: Text(
                          'Powered by - aisonesystems.com',
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  letterSpacing: .5)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: Pr_height * 0, left: Pr_width * 0.89),
                    child: IconButton(
                      icon: Icon(
                        Icons.phone_forwarded_outlined,
                        size: 20,
                        color: Colors.indigoAccent,
                      ),
                      onPressed: () async {
                        Uri phoneno = Uri.parse('tel:+923214457734');
                        if (await launchUrl(phoneno)) {
                          //dialer opened
                        } else {
                          //dailer is not opened
                        }
                      },
                    ),
                  ),
                ],
              ),
            )),
        body: Container(
          height: Pr_height,
          width: Pr_width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFD1FFFF),
                Color(0xFF88ECF8),
                Color(0xFF65DCDC),
              ],
              stops: [0.0, 0.5, 0.7, 0.9],
            ),
          ),
          child: Stack(children: <Widget>[
            Container(
              height: Pr_height * 500,
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: Pr_height * 0.08, left: Pr_width * 0.375),
              child: Shimmer.fromColors(
                  baseColor: Colors.black26,
                  highlightColor: Colors.cyanAccent,
                  child: Text("Label")),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: Pr_height * 0.120, left: Pr_width * 0.375),
              child: SizedBox(
                height: 105,
                child: Image.asset("assets/aa.png"),
              ),
            ),
            //Cards and Decorated Containers
            Padding(
              padding: EdgeInsets.only(top: Pr_height * 0.24, left: Pr_height*0),
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        l_VmAssignedBranches.l_PrAssignedBranchesList?.length,
                    itemBuilder: (context, index) {
                      //get selected index on tap,
                      //after that got Company Did that index
                      return Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              l_VmAssignedBranches.FncSelectedBranch();
                              //Get.to(() => vi_Drawer());

                              setState(() {
                                l_VmAssignedBranches.l_PrselectedIndex.value =
                                    index;
                              });
                            },
                            child: SizedBox(
                              width: Pr_width * .990,
                              height: Pr_height * .175,
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  (index % 2 == 0)
                                                      ? Colors.lightBlueAccent
                                                          .shade100
                                                      : Colors
                                                          .redAccent.shade100,
                                                  (index % 2 == 0)
                                                      ? Colors.lightBlueAccent
                                                          .shade100
                                                      : Colors
                                                          .redAccent.shade100,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 4),
                                            color: Colors.teal,
                                            blurRadius: 10,
                                          )
                                        ])),
                                    Positioned.fill(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              "assets/company.png",
                                              height: 64,
                                              width: 64,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                //lblbranchName,
                                                SizedBox(
                                                  height: 12,
                                                ),

                                                Text(
                                                  l_VmAssignedBranches
                                                      .l_PrAssignedBranchesList![
                                                          index]
                                                      .pr_BranchName,
                                                  style: GoogleFonts.ubuntu(
                                                      textStyle: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: .5)),
                                                ),
                                                const SizedBox(height: 16),
                                                Wrap(
                                                  spacing: 10.0,
                                                  runSpacing: 10.0,
                                                  direction: Axis.vertical,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        const Icon(
                                                          MdiIcons.googleMaps,
                                                          size: 18,
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          l_VmAssignedBranches
                                                              .l_PrAssignedBranchesList![
                                                                  index]
                                                              .pr_BranchName,
                                                          style: GoogleFonts.ubuntu(
                                                              textStyle: TextStyle(
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  letterSpacing:
                                                                      .5)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "",
                                                  style: GoogleFonts.ubuntu(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 18,
                                                              letterSpacing:
                                                                  .5)),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
            ),
          ]),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        //when tap anywhere on screen keyboard dismiss
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //Get device's screen height and width.
              double height = constraints.maxHeight;
              double width = constraints.maxWidth;

              if (width >= 300 && width < 500) {
                return _WidgetportraitMode(height, width);
              } else {
                return _WidgetportraitMode(height, width);
              }
            },
          );
        },
      ),
    );
  }

//=================DART==================

}
