import 'package:flutter/material.dart';
import 'package:sber/components/history_appbar.dart';
import 'package:sber/pages/home_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF435063),
                    Color(0xFF37424F),
                    Color(0xFF303743),
                    Color(0xFF24272E),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(children: [
                const SizedBox(
                  height: 100,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'История',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 12),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '...',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 150,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Skeletonizer(
                        enabled: enabled,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 220,
                                  child: AspectRatio(
                                    aspectRatio: 1.8,
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xFF1E1E1E),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Расходы в марте',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[400],
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Icon(
                                                    size: 16,
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              const Text(
                                                '17 923 ₽',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Row(
                                                children: [
                                                  Text(
                                                    '+ 20 600 ₽',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
        const HistoryAppBar()
      ],
    ));
  }
}
