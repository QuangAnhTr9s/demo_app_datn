import 'package:demo_app/home_page/home_page_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  final _homePageBloc = HomePageBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _homePageBloc.tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _homePageBloc.dispose();
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Hi'),centerTitle: true,),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              //build TabBar
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                height: 40,
                child: TabBar(
                    controller: _homePageBloc.tabController,
                    indicatorColor: Colors.grey,// màu thanh trượt
                    indicatorWeight: 2,
                    labelPadding: const EdgeInsets.only(right: 18),
                    labelColor: const Color(0xffef1951),
                    //color when not selected
                    unselectedLabelColor: Colors.grey,
                    //color when selected
                    tabs:  [
                      Text("Living Room", style: Theme.of(context).textTheme.titleMedium,),
                      Text("Bedroom", style: Theme.of(context).textTheme.titleMedium,),
                      Text("Kitchen", style: Theme.of(context).textTheme.titleMedium,),
                    ]),
              ),
              //build TabView
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  width: double.maxFinite,
                  child: TabBarView(
                      controller: _homePageBloc.tabController,
                      children: [
                        //build Living Room TabBar
                        _buildLivingRoomTabBar(context),
                        // build Quản lý TabBar(),
                        _buildBedroomTabBar(context),
                        //build Kitchen TabBar(),
                        _buildKitchenTabBar(context)
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLivingRoomTabBar(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text("Temperature: ${_homePageBloc.temperature} °C", style: Theme.of(context).textTheme.displayMedium,),
           const SizedBox(height: 10,),
           Text("Humidity: ${_homePageBloc.humidity} %", style: Theme.of(context).textTheme.displayMedium,),
          const SizedBox(height: 10,),
          Text("Gas: ${_homePageBloc.gas}", style: Theme.of(context).textTheme.displayMedium,),
          const SizedBox(height: 20,),
          //Light 1
          // buildButtonLight(_homePageBloc.light1Stream, _homePageBloc.handleClickLightButton1()),
          // buildButtonLight(_homePageBloc.light2Stream, _homePageBloc.handleClickLightButton2()),
          // buildButtonLight(_homePageBloc.light3Stream, _homePageBloc.handleClickLightButton3()),
          // buildButtonLight(_homePageBloc.humidityStream, _homePageBloc.handleClickHumidityButton()),
          StreamBuilder<bool>(
              stream: _homePageBloc.light1Stream,
              builder: (context, snapshot) {
                final isClicked = snapshot.data ?? false;
                return InkWell(
                  onTap: () => _homePageBloc.handleClickLightButton1(),
                  child: MyIconButton(isClicked: isClicked, iconData: Icons.light_mode,),
                );
              }
          ),
          StreamBuilder<bool>(
              stream: _homePageBloc.light2Stream,
              builder: (context, snapshot) {
                final isClicked = snapshot.data ?? false;
                return InkWell(
                  onTap: () => _homePageBloc.handleClickLightButton2(),
                  child: MyIconButton(isClicked: isClicked, iconData: Icons.light_mode_outlined),
                );
              }
          ),
          StreamBuilder<bool>(
              stream: _homePageBloc.light3Stream,
              builder: (context, snapshot) {
                final isClicked = snapshot.data ?? false;
                return InkWell(
                  onTap: () => _homePageBloc.handleClickLightButton3(),
                  child: MyIconButton(isClicked: isClicked, iconData: Icons.light_mode_outlined),
                );
              }
          ),
          StreamBuilder<bool>(
              stream: _homePageBloc.fanStream,
              builder: (context, snapshot) {
                final isClicked = snapshot.data ?? false;
                return InkWell(
                  onTap: () => _homePageBloc.handleClickfanButton(),
                  child: MyIconButton(isClicked: isClicked, iconData: Icons.flip_camera_android),
                );
              }
          ),
        ],
    );
  }

/*  Widget buildButtonLight(Stream<bool> stream, void handleClickTemperatureButton, ) {
    return StreamBuilder<bool>(
          stream: stream,
          builder: (context, snapshot) {
            final isClicked = snapshot.data ?? false;
            return Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: isClicked == true ?Colors.yellow:Colors.grey, borderRadius: BorderRadius.circular(50)),
              child: IconButton(onPressed: () => handleClickTemperatureButton,
                  icon: const Icon(Icons.ac_unit,)),
            );
          }
        );
  }*/

  Widget _buildBedroomTabBar(BuildContext context) {
    return Column();
  }
  Widget _buildKitchenTabBar(BuildContext context) {
    return Column();
  }
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.isClicked,
    required this.iconData,
  });

  final bool isClicked;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(color: isClicked == true ?Colors.yellow:Colors.grey, borderRadius: BorderRadius.circular(50)),
      child: Icon(iconData, size: 50, color: Colors.white,),
    );
  }
}
