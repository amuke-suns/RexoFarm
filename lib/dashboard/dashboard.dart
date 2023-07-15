import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
import 'see_more_button.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onWithdrawButtonPressed() {
    // Add your desired functionality when the withdraw button is pressed
    print('Withdraw button pressed');
  }

  void seeMoreButtonPressed() {
    // Add your desired functionality when the see more button is pressed
    print('See more button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 68, 2, 24),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 20.0,
                        left: 16.0,
                        top: 8.0,
                      ),
                      child: const Text(
                        'Hello John',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 20.0,
                        right: 0.0,
                        top: 8.0,
                      ),
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'images/Notification.png',
                        width: 36,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 159,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'images/Rectangle 92.png',
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'images/Rectangle 91.png',
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 32,
                        child: Text(
                          'Your Wallet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 32,
                        child: Text(
                          'Available Balance',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 32,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '\u{20A6}', // Naira sign
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '250,000',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 75,
                        left: 230,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.south_west, size: 18),
                          // Arrow icon facing down
                          label: const Text('Withdraw'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 11),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 220, 24),
                  child: const Text(
                    'Recent Shipments',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 2, 24),
                  width: 358,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // today86Z (97:510)
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                        child: const Text(
                          'Today',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                            color: Color(0xff454743),
                          ),
                        ),
                      ),
                      SizedBox(
                        // frame214S7F (97:526)
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // frame212zeZ (97:521)
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              padding: const EdgeInsets.fromLTRB(8, 9, 8, 9),
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xfff6f6f6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // frame213i4m (97:522)
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 132, 0),
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // fish3sj (97:523)
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: const Text(
                                            'Fish',
                                            style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 1.0714285714,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          // cmdroadmagodolagosjEm (97:524)
                                          'CMD road, Magodo, Lagos',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 1.25,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    // completedqHo (97:525)
                                    'Completed',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.25,
                                      color: Color(0xff00a836),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // frame211Aay (97:494)
                              padding: const EdgeInsets.fromLTRB(8, 9, 8, 9),
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xfff6f6f6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // frame213h57 (97:515)
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 143, 0),
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // vegetablespQd (97:513)
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: const Text(
                                            'Vegetables',
                                            style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 1.0714285714,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          // chevronroadlekkilagosx13 (97:514)
                                          'Chevron road, Lekki, Lagos',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 1.25,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    // ongoingHZ7 (97:516)
                                    'Ongoing',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.25,
                                      color: Color(0xfff29528),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // frame216dss (97:528)
                  margin: const EdgeInsets.fromLTRB(0, 0, 2, 32),
                  width: 358,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // yesterdaynEy (97:529)
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                        child: const Text(
                          'Yesterday',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.25,
                            color: Color(0xff454743),
                          ),
                        ),
                      ),
                      SizedBox(
                        // frame214v6H (97:530)
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // frame212 (97:531)
                              padding: const EdgeInsets.fromLTRB(8, 9, 8, 9),
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xfff6f6f6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // frame213NDB (97:532)
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 137, 0),
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // plantains6ey (97:533)
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: const Text(
                                            'Plantains',
                                            style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 1.0714285714,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          // allenavenueikejalagosc7X (97:534)
                                          'Allen Avenue, Ikeja, Lagos',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 1.25,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    // completedZ2m (97:535)
                                    'Completed',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.25,
                                      color: Color(0xff00a836),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              // frame211VSD (97:536)
                              padding: const EdgeInsets.fromLTRB(8, 9, 8, 9),
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xfff6f6f6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // frame213nAR (97:537)
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 171, 0),
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // vegetablesj5f (97:538)
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: const Text(
                                            'Vegetables',
                                            style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 1.0714285714,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          // alausaikejalagosfED (97:539)
                                          'Alausa, Ikeja, Lagos',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 1.25,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    // completedDFj (97:541)
                                    'Completed',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.25,
                                      color: Color(0xff00a836),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              // frame2139v5 (97:542)
                              padding: const EdgeInsets.fromLTRB(8, 9, 8, 9),
                              width: double.infinity,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xfff6f6f6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // frame213SuB (97:543)
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 171, 0),
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // grapeszvh (97:544)
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: const Text(
                                            'Grapes',
                                            style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              height: 1.0714285714,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          // alausaikejalagos5hF (97:545)
                                          'Alausa, Ikeja, Lagos',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            height: 1.25,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    // completedEa9 (97:546)
                                    'Completed',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      height: 1.25,
                                      color: Color(0xff00a836),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: SeeMoreButton(
                    onPressed: seeMoreButtonPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
    );
  }
}
