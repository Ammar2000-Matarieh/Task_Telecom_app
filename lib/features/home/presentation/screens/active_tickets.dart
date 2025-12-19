import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_support_app/core/extensions/size.dart';
import 'package:telecom_support_app/core/utils/app_colors.dart';
import 'package:telecom_support_app/core/utils/app_strings.dart';
import 'package:telecom_support_app/features/google_map/presentation/cubit/cubit/sync_cubit.dart';
import 'package:telecom_support_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:telecom_support_app/features/home/presentation/screens/tickets_details.dart';

class ActiveTickets extends StatefulWidget {
  const ActiveTickets({super.key});

  @override
  State<ActiveTickets> createState() => _ActiveTicketsState();
}

class _ActiveTicketsState extends State<ActiveTickets> {
  @override
  void initState() {
    super.initState();

    // 1️⃣ Start connectivity + sync listener
    context.read<SyncCubit>().start();

    // 2️⃣ Load tickets
    context.read<HomeCubit>().activeTicketsRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.activeTicketsKey),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeSuccessState) {
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<HomeCubit>().activeTicketsRequest();
              },
              child: Column(
                children: [
                  // 🔥 Indicator
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    color: state.isOffline ? Colors.red : Colors.green,
                    child: Text(
                      state.isOffline
                          ? AppStrings.offlineTicketKey
                          : AppStrings.onlineTicketKey,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),

                  // Tickets List
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 2.h),
                      padding: EdgeInsets.all(10),
                      itemCount: state.res.length,
                      itemBuilder: (context, index) {
                        final ticket = state.res[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TicketsDetails(ticket: ticket),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.r),
                              border: Border.all(
                                color: AppColors.black,
                                width: 0.4,
                              ),
                            ),
                            child: ListTile(
                              title: Text(ticket.customerName),
                              subtitle: Text(ticket.email),
                              trailing: Text(ticket.phone),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is HomeErrorState) {
            return Center(child: Text(state.error));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
