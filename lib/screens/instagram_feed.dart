import 'package:flutter/material.dart';
import 'package:flutter_course/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  TextStyle _hashTagStyle = TextStyle(
    color: Colors.deepOrange,
  );

  List<int> ids = [2, 5, 7, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram feeds'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _drawHeader(index),
                _drawTitle(),
                _drawHashTags(),
                _drawBody(),
                _drawFooter(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 24,
                backgroundImage:
                    ExactAssetImage('assets/images/placeholder_bg.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    'Medhat Mohamed',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  'Fri, 12 May 2020 - 14:30',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Transform.translate(
          offset: Offset(-16, 0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  ids.contains(index) ? Icons.favorite : Icons.favorite_border,
                  color: ids.contains(index) ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  if (ids.contains(index)) {
                    ids.remove(index);
                  } else {
                    ids.add(index);
                  }
                  setState(() {});
                  print(ids);
                },
              ),
              Transform.translate(
                offset: Offset(-8, 0),
                child: Text(
                  '25',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _drawBody() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .25,
        child: Image(
          image: ExactAssetImage('assets/images/placeholder_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _drawFooter() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text(
            '18 Comments',
            style: _hashTagStyle,
          ),
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                'Share',
                style: _hashTagStyle,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'Open',
                style: _hashTagStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        'Instagram title retrieved from api',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(
              '#adventure',
              style: _hashTagStyle,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              '#adventure',
              style: _hashTagStyle,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              '#adventure',
              style: _hashTagStyle,
            ),
          ),
        ],
      ),
    );
  }
}
