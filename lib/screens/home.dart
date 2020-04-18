import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress = "you'r current location will appear here!";

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: _appBar(),
      endDrawer: Drawer(),
      body: _body(),
    ));
  }

  Widget _appBar() {
    return AppBar(
      title: Row(
        children: <Widget>[
          SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 15,
          ),
          _address(),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.edit),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Icon(Icons.call),
        ],
      ),
    );
  }

  Widget _address() {
    return Row(
      children: <Widget>[
        Icon(Icons.room),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 200,
          child: Text(
            '$_currentAddress',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: boxConstraints.maxHeight,
                ),
                child: Column(
                  children: <Widget>[
                    _profile(),
                    SizedBox(
                      height: 30,
                    ),
                    _healthAdvisor(),
                    SizedBox(
                      height: 30,
                    ),
                    _insuranceProducts()
                  ],
                )));
      },
    );
  }

  Widget _profile() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      width: size.width,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 5,
        child: Row(
          children: <Widget>[
            _profilePic(),
            SizedBox(
              width: 10,
            ),
            _userDetails(),
          ],
        ),
      ),
    );
  }

  Widget _profilePic() {
    return Expanded(
      flex: 1,
      child: Container(
        height: 100,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.person,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.camera_enhance,
              ),
            ),
          ],
        ),
        decoration: new BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _userDetails() {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sarvesh Chavan',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          _address(),
          SizedBox(
            height: 20,
          ),
          _datePicker(),
        ],
      ),
    );
  }

  Widget _datePicker() {
    return Row(
      children: <Widget>[
        Icon(Icons.date_range),
        SizedBox(
          width: 10,
        ),
        Text(
          '12-Apr-1994',
        )
      ],
    );
  }

  Widget _healthAdvisor() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Text(
              'Health Advisor',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _healthAdvisorHorizontalList(),
      ],
    );
  }

  Widget _healthAdvisorHorizontalList() {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 200,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Text(
                          "From treatment guidance to post hospitalization care"),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: RaisedButton(
                          onPressed: () {
                            _getAddressFromLatLng();
                          },
                          child: Text('Get in touch'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _insuranceProducts() {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Text(
              'Explore our Insurance Products',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        _insuranceProductsVerticalList(),
      ],
    );
  }

  Widget _insuranceProductsVerticalList() {
    return SizedBox(
      height: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.ac_unit),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Health Insurance redefined',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Lorem ipsum dolor sitamet is a placeholder text...',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress =
            "${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
      });
    } catch (e) {
      print(e);
    }
  }
}
