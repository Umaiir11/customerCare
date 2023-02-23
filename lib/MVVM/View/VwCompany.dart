import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:customercare/MVVM/View/VwAssignedBranches.dart';
import 'package:customercare/MVVM/View/VwDrawer.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ViewModel/VmCompany.dart';

class VwCompany extends StatefulWidget {
  const VwCompany({Key? key}) : super(key: key);

  @override
  State<VwCompany> createState() => _VwCompanyState();
}

class _VwCompanyState extends State<VwCompany> {
  @override
  final VmCompany l_VmCompany = Get.put(VmCompany());

  void initState() {
    // TODO: implement initState
    super.initState();
    l_VmCompany.Fnc_addItem();
  }

  final TextEditingController l_SerachController = TextEditingController();

  @override
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
                        Icons.whatsapp_outlined,
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
          child: Stack(
            children: <Widget>[
              Container(
                height: Pr_height * 500,
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: Pr_height * 0.070, left: Pr_width * 0.2),
                child: Shimmer.fromColors(
                    baseColor: Colors.black38,
                    highlightColor: Colors.cyanAccent,
                    child: Text("lblCompanyList")),
              ),

              AnimatedContainer(
                duration: Duration(milliseconds: 370),
                margin: EdgeInsets.only(
                    top: Pr_height * 0.170, left: Pr_width * 0.0400),
                width: l_VmCompany.l_PrisFolded ? 56 : 320,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.lightBlueAccent.shade100,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 16),
                            child: !l_VmCompany.l_PrisFolded
                                ? TextField(
                                    controller: l_SerachController,
                                    //onChanged: FncfilterSearchResults,
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: InputBorder.none,
                                    ),
                                  )
                                : null)),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 370),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  l_VmCompany.l_PrisFolded ? 32 : 0),
                              topRight: Radius.circular(32),
                              bottomLeft: Radius.circular(
                                  l_VmCompany.l_PrisFolded ? 32 : 0),
                              bottomRight: Radius.circular(32),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(
                                size: 20,
                                l_VmCompany.l_PrisFolded
                                    ? Icons.search
                                    : Icons.close,
                                color: Colors.black87,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                l_VmCompany.l_PrisFolded !=
                                    l_VmCompany.l_PrisFolded;
                              });
                            }),
                      ),
                    )
                  ],
                ),
              ),

              //Cards and Decorated Containers

              Padding(
                padding: EdgeInsets.only(top: Pr_height * 0.21, left: 0),
                child: Obx(() => ListView.builder(
                      itemCount: l_VmCompany.l_PrCompanyList?.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (await l_VmCompany.Fnc_OnlineToken() == true) {
                                  if (await l_VmCompany.Fnc_OnlineAssignedBranches() == true)
                                    if (  l_VmCompany.l_Prcount > 1    )
                                    {
                                      cmGlobalVariables.PbDefaultBranch = l_VmCompany.l_PrAssignedBranchesList![0]
                                            .pr_BranchDID;
                                    Get.to(() => VwAssignedBranches());
                                    Get.snackbar("Company URl",
                                        cmGlobalVariables.Pb_ERPApiUrl!);
                                  } else {
                                    Get.to(() => vi_Drawer());

                                  }
                                }

                                setState(() {
                                  l_VmCompany.Pr_txtselectedIndex_Text.value = index;
                                });
                              },
                              child: SizedBox(
                                width: Pr_width * .990,
                                height: Pr_height * .175,
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: Pr_height * .175,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    (index % 2 == 0)
                                                        ? Colors.lightBlueAccent
                                                            .shade100
                                                        : Colors
                                                            .lightBlue.shade100,
                                                    (index % 2 == 0)
                                                        ? Colors.lightBlueAccent
                                                            .shade100
                                                        : Colors
                                                            .lightBlue.shade100,
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
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Pr_height * .015,
                                            left: Pr_width * .083),
                                        child: Text(
                                          l_VmCompany.l_PrCompanyList![index]
                                              .Pr_CompanyName,
                                          //G_CompanyList[index].Pr_CompanyName,
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Pr_height * .057,
                                            left: Pr_width * .083),
                                        child: Text(
                                          'Email',
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black26,
                                                  //fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Pr_height * .081,
                                            left: Pr_width * .083),
                                        child: Text(
                                          l_VmCompany.l_PrCompanyList![index]
                                              .Pr_EmailId,
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Pr_height * .101,
                                            left: Pr_width * .083),
                                        child: Text(
                                          'Address',
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black26,
                                                  //fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Pr_height * .126,
                                            left: Pr_width * .083),
                                        child: Text(
                                          l_VmCompany.l_PrCompanyList![index]
                                              .Pr_CompanyAddress
                                              .toString(),
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Pr_height * .057,
                                            left: Pr_width * .600),
                                        child: Text(
                                          'Phone',
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black26,
                                                  //fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: Pr_height * .081,
                                            left: Pr_width * .600),
                                        child: Text(
                                          l_VmCompany.l_PrCompanyList![index]
                                              .Pr_CompanyPhone
                                              .toString(),
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: .5)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    )),
              ),
            ],
          ),
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
}
