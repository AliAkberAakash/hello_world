import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/core/network/api_base_helper.dart';
import 'package:hello_world/core/network/dio_factory.dart';
import 'package:hello_world/core/network/network_info.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:hello_world/data/datasources/remote_datasource/rest_service.dart';
import 'package:hello_world/data/repositories/repository.dart';
import 'package:hello_world/data/repositories/repository_impl.dart';
import 'package:hello_world/di/dependency_injection.dart';
import 'package:hello_world/ui/features/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(repository: locator<Repository>()),
        child: Builder(
          builder: (ctxB){
            ctxB.bloc<HomeBloc>().add(GetMessageEvent());
            print("Event was loaded");
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (ctx, state){
                if(state is HomeLoadedState) {
                  if(state.response!=null){
                    if(state.response.success){
                      return Center(
                        child: Text(
                          state.response.message,
                        ),
                      );
                    }
                  }
                }

                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
