import 'package:flutter/material.dart';

class Meter {
  String name;
  IconData icon;
  String serial;

  Meter(name, serial, icon) {
    this.name = name;
    this.serial = serial;
    this.icon = icon;
  }
}

class MeterList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MetersState();
  }
}

class MetersState extends State<MeterList> {
  List<Meter> _meters = new List();

  MetersState() {
    _meters.add(new Meter('Bath', '68132e62r', Icons.branding_watermark));
    _meters.add(new Meter('Electricity', '3r4rf441', Icons.equalizer));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff373B44),
      child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: /*1*/ (context, i) {
            if (i.isOdd) return Divider();

            final index = i ~/ 2;

            if (index >= _meters.length) {
              return null;
            }

            return _buildRow(_meters[index]);
          }),
    );
  }

  Widget _buildRow(Meter meter) {
    return ListTile(
        leading: Icon(meter.icon),
        title: Text(meter.name, style: TextStyle(fontSize: 24)),
        subtitle: Text(meter.serial),
        trailing: Text(
          '10m3',
          style: TextStyle(color: Theme.of(context).accentColor, fontSize: 24),
        ),
        onTap: () {
          setState(() {});
        });
  }
}
