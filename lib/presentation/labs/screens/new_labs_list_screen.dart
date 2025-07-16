import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlbisibida_doc/components/default_button.dart';
import 'package:tlbisibida_doc/components/tusk_icons.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_cubit.dart';
import 'package:tlbisibida_doc/presentation/labs/screens/cubit/labs_states.dart';

import 'package:tlbisibida_doc/services/navigation/routes.dart';

class LabsListScreen extends StatelessWidget {
  LabsListScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  int _getCenteredIndex(ScrollMetrics metrics, int itemCount, double itemWidth,
      double separatorWidth) {
    final double center = metrics.pixels + metrics.viewportDimension / 2;
    final double totalItemWidth = itemWidth + separatorWidth;
    int index = (center / totalItemWidth).floor();
    if (index < 0) return 0;
    if (index >= itemCount) return itemCount - 1;
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cyan50,
      body: SingleChildScrollView(
        child: BlocConsumer<LabsCubit, LabsState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<LabsCubit>();
            final labsList = cubit.unsubscribedLabsData?.data ?? [];
            final isLoadingMore = state is LabsLoading && labsList.isNotEmpty;
            final focusedIndex = cubit.focusedLabIndex;

            // Call getUnsubscribedLabDetails when focused lab changes
            if (labsList.isNotEmpty &&
                (cubit.unsubscribedLabDetails == null ||
                    cubit.unsubscribedLabDetails?.labName !=
                        labsList[focusedIndex].labName)) {
              cubit.getUnsubscribedLabDetails(labsList[focusedIndex].id!);
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    color: cyan200,
                    height: 200,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (scrollInfo is ScrollUpdateNotification) {
                          final index = _getCenteredIndex(
                            scrollInfo.metrics,
                            labsList.length,
                            180, // item width
                            20, // separator width
                          );
                          if (index != cubit.focusedLabIndex) {
                            cubit.setFocusedLabIndex(index);
                          }
                        }
                        if (scrollInfo.metrics.pixels >=
                                scrollInfo.metrics.maxScrollExtent - 200 &&
                            !isLoadingMore &&
                            cubit.unsubscribedLabsData?.nextPageUrl != null) {
                          cubit.getUnsubscribedLabs(nextPage: true);
                        }
                        return false;
                      },
                      child: ListView.separated(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: labsList.length + (isLoadingMore ? 1 : 0),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20),
                        itemBuilder: (context, index) {
                          if (index >= labsList.length) {
                            return const Center(
                                child: SizedBox(
                                    width: 60,
                                    child: CircularProgressIndicator()));
                          }
                          final lab = labsList[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: cyan100,
                                borderRadius: BorderRadius.circular(30)),
                            height: 180,
                            width: 180,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (lab.labLogo != null)
                                    Image.network(
                                      lab.labLogo!,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  SizedBox(height: 20),
                                  Text(
                                    lab.labName ?? '',
                                    style: TextStyle(color: cyan600),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // Details container, now dynamic:
                BlocBuilder<LabsCubit, LabsState>(
                  builder: (context, state) {
                    final details = cubit.unsubscribedLabDetails;
                    if (details == null) {
                      return const Padding(
                        padding: EdgeInsets.all(32.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    // Build your details UI using details
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: cyan100,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.business),
                                  Text(
                                    details.labName ?? '',
                                    style:
                                        TextStyle(color: cyan600, fontSize: 22),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(color: cyan300, height: .5, width: 200),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('الاختصاص'),
                                      SizedBox(height: 10),
                                      Text(details.labType ?? ''),
                                    ],
                                  ),
                                  Container(
                                      color: cyan300, height: 50, width: .5),
                                  Column(
                                    children: [
                                      Text('العنوان'),
                                      SizedBox(height: 10),
                                      Text(details.labAddress ?? ''),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(color: cyan300, height: .5, width: 200),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(details.labPhone ?? ''),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Text('ارقام التواصل'),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(color: cyan300, height: .5, width: 200),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(details.labFromHour ?? ''),
                                      SizedBox(height: 10),
                                      Text(details.labToHour ?? ''),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Text('أوقات الدوام '),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(color: cyan300, height: .5, width: 200),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(details.fullName ?? ''),
                                  SizedBox(width: 20),
                                  Text(' مدير المخبر '),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(color: cyan300, height: .5, width: 200),
                              const SizedBox(height: 20),
                              defaultButton(
                                  text: ' طلب انضمام',
                                  function: () {
                                    cubit.submitJoinRequestToLab(details.id!);
                                  }),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
