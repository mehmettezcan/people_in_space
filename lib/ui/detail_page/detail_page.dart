import 'package:boilerplate/stores/post/post_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PostStore _postStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _postStore = Provider.of<PostStore>(context);
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(_postStore.currentAstronaut.name,style: TextStyle(
          color: Colors.white
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: DecorationImage(
                      image: NetworkImage(_postStore.currentAstronaut.biophoto),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('${_postStore.currentAstronaut.name} ${_postStore.currentAstronaut.country.toUpperCase()}', style: TextStyle(
                  fontSize: 25
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(_postStore.currentAstronaut.launchdate, style: TextStyle(
                  fontSize: 15
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(_postStore.currentAstronaut.bio, style: TextStyle(
                  fontSize: 15
              ),),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: InkWell(
                      child: new Text('Twitterına Git'),
                      onTap: () => launch(_postStore.currentAstronaut.twitter)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: InkWell(
                      child: new Text('Bio linki'),
                      onTap: () => launch(_postStore.currentAstronaut.biolink)
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
