import 'package:admin_pannel/core/constants/app_color.dart';
import 'package:admin_pannel/presentation/home/bloc/user_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewVertical extends StatefulWidget {
  const ListViewVertical({
    super.key,
  });

  @override
  State<ListViewVertical> createState() => _ListViewVerticalState();
}

class _ListViewVerticalState extends State<ListViewVertical> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state.userDetailsStateEnum == UserDetailsStateEnum.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.userModelList != null &&
            state.userModelList!.isNotEmpty) {
          return Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'photo',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'name',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'number',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'email',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Status',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Operation',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Action',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.userModelList!.length,
                  itemBuilder: (context, index) {
                    final user = state.userModelList![index];
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColor.cardBackgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(user.picture),
                                ),
                                Text(
                                  user.name?.en ?? 'a',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  user.cell.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  user.email,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                user.isActive
                                    ? Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'Active',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade100,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'Inactive',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                user.isAdmin
                                    ? Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'Admin',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Text(
                                          'User',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state.error != null) {
          return Center(
            child: Text(state.error!),
          );
        } else {
          return const Center(
            child: Text("No Data Found"),
          );
        }
      },
    );
  }
}
