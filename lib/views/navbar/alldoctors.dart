import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental/utils/app_colors.dart';
import 'package:mental/views/doctor_details.dart';

class AllDoctor extends StatefulWidget {
  const AllDoctor({Key? key}) : super(key: key);

  @override
  State<AllDoctor> createState() => _MainScreenState();
}

class _MainScreenState extends State<AllDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("\nAll Doctors"),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("doctor").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  final snap = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      // return Container(
                      //   height: 120,
                      //   width: double.infinity,
                      //   margin: const EdgeInsets.only(bottom: 12),
                      //   decoration: BoxDecoration(
                      //     color: Color.fromARGB(255, 110, 218, 197),
                      //     borderRadius: BorderRadius.circular(10),
                      //     boxShadow: const [
                      //       BoxShadow(
                      //         color: Colors.black26,
                      //         offset: Offset(2, 2),
                      //         blurRadius: 10,
                      //       ),
                      //     ],
                      //   ),
                      //   child: ListTile(
                      //     hoverColor: AppColors.whiteColor,
                      //     title: Text(
                      //       snap[index]['name'],
                      //       maxLines: 1,
                      //       overflow: TextOverflow.ellipsis,
                      //       style: GoogleFonts.poppins(fontSize: 18),
                      //     ),
                      //     subtitle: Text(snap[index]['specialist ']),
                      //     leading: CircleAvatar(
                      //       backgroundImage: NetworkImage(snap[index]['image']),
                      //     ),
                      //   ),
                      // );

                      return Container(
                        height: 120,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 110, 218, 197),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(snap[index]['image']),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(snap[index]['name'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500)),
                                  Text(snap[index]['specialist '],
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w200)),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_history),
                                  Text(
                                    'Basundhara R/A',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            FloatingActionButton(
            child: Text('click here'),
              
              onPressed: (() {
              Get.to(() => DoctorDetatls());

            }))
          ],
        ),
      ),
    );
  }
}
