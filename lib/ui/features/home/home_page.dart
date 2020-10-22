import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/core/network/api_base_helper.dart';
import 'package:hello_world/core/network/dio_factory.dart';
import 'package:hello_world/core/network/network_info.dart';
import 'package:hello_world/core/pages/empty_page.dart';
import 'package:hello_world/core/pages/loading_pge.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:hello_world/data/datasources/remote_datasource/rest_service.dart';
import 'package:hello_world/data/models/message_response.dart';
import 'package:hello_world/data/repositories/repository.dart';
import 'package:hello_world/data/repositories/repository_impl.dart';
import 'package:hello_world/di/dependency_injection.dart';
import 'package:hello_world/ui/features/home/home_bloc.dart';
import 'package:hello_world/utils/string_formatter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  MessageResponse _response;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home"
        ),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(repository: locator<Repository>())
        ..add(GetMessageEvent()), //load data at the start
        child: Builder(
          builder: (ctxB){
            print("Event was loaded");
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (ctx, state){
                if(state is HomeLoadingState){
                  return LoadingPage();
                }else if(state is HomeLoadedState) {
                  if(state.response!=null){
                    _response = state.response; //in case we need the response
                    if(state.response.success){
                      return Center(
                        child: Text(
                          checkNull(_response?.message),
                        ),
                      );
                    }
                  }
                }
                return EmptyPage(message: "Failed to load data from the server",);
              },
            );
          },
        ),
      ),
    );
  }
}
