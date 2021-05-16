import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:get/get.dart';
import '../models/movie.dart';

const supabaseUrl = 'https://tedrfqhnhtkeswbyvcuu.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYxNDMxOTIyMiwiZXhwIjoxOTI5ODk1MjIyfQ.gWWL0dhjegysQ4EZFQcYLOg19iBea1OUfW3ucyi-Qp8';
final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);

class Controller extends GetxController {
  var name = "init name".obs;
  var description = "init description".obs;
  var operation = 0.obs;
}

class SupabaseAPI extends StatefulWidget {
  @override
  _SupabaseAPIState createState() => _SupabaseAPIState();
}

class _SupabaseAPIState extends State<SupabaseAPI> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SupabaseAPI'),
          elevation: 1,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              Tab(text: "READ"),
              Tab(text: "INSERT"),
              Tab(text: "DELETE"),
              Tab(text: "UPDATE"),
              Tab(text: "REALTIME"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Read(),
            Insert(),
            Delete(),
            Update(),
            Realtime(),
          ],
        ),
      ),
    );
  }

  Widget Read() {
    return FutureBuilder<List<Movie>>(
      future: getMovies(),
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data
                .map((movie) => ListTile(
                      title: Text(movie.name),
                      subtitle: Text(movie.description),
                    ))
                .toList(),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  } // Read Widget

  Widget Insert() {
    TextEditingController _nameFieldController = TextEditingController();
    TextEditingController _descriptionFieldController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 12),
          TextField(
            obscureText: false,
            controller: _nameFieldController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'name',
            ),
            maxLines: 1,
          ),
          SizedBox(height: 12),
          TextField(
            obscureText: false,
            controller: _descriptionFieldController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'description',
            ),
            maxLines: 5,
          ),
          SizedBox(height: 8),
          FlatButton(
            onPressed: () {
              insertMovies(_nameFieldController.text, _descriptionFieldController.text);
              _nameFieldController.text = "";
              _descriptionFieldController.text = "";
            },
            child: Text(
              'INSERT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget Delete() {
    TextEditingController _nameFieldController = new TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 12),
          TextField(
            obscureText: false,
            controller: _nameFieldController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'name',
            ),
            maxLines: 1,
          ),
          SizedBox(height: 8),
          FlatButton(
            onPressed: () {
              deleteMovies(_nameFieldController.text);
              _nameFieldController.text = "";
            },
            child: Text(
              'DELETE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget Update() {
    TextEditingController _nameFieldController = TextEditingController();
    TextEditingController _descriptionFieldController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 12),
          TextField(
            obscureText: false,
            controller: _nameFieldController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'name',
            ),
            maxLines: 1,
          ),
          SizedBox(height: 12),
          TextField(
            obscureText: false,
            controller: _descriptionFieldController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'description',
            ),
            maxLines: 5,
          ),
          SizedBox(height: 8),
          FlatButton(
            onPressed: () {
              updateMovies(_nameFieldController.text, _descriptionFieldController.text);
              _nameFieldController.text = "";
              _descriptionFieldController.text = "";
            },
            child: Text(
              'UPDATE',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.pink,
          ),
        ],
      ),
    );
  }

  Widget Realtime() {
    final Controller controller = Get.put(Controller());
    final Operation = [
      Icons.fingerprint,
      Icons.playlist_add,
      Icons.delete,
      Icons.update,
    ];
    final OperationColor = [
        Colors.black,
        Colors.green,
        Colors.red,
        Colors.pink,
    ];

    final _response = supabaseClient.from('DummyTable').on(SupabaseEventTypes.insert, (payload) {
      controller.name.value = payload.newRecord['name'];
      controller.description.value = payload.newRecord['description'];
      controller.operation.value = 1;
    }).on(SupabaseEventTypes.delete, (payload) {
      controller.operation.value = 2; // only id can be get in this case using oldRecord['id']
    }).on(SupabaseEventTypes.update, (payload) {
      controller.name.value = payload.newRecord['name'];
      controller.description.value = payload.newRecord['description'];
      controller.operation.value = 3;
    }).subscribe();

    return Obx(
      () => ListTile(
        leading: Icon(
          Operation[controller.operation.value],
          color: OperationColor[controller.operation.value],
          size: 30.0,
        ),
        title: Text('${controller.name.string}'),
        subtitle: Text('${controller.description.string}'),
      ),
    );
  }

  void updateMovies(String name, String description) async {
    final _response = await supabaseClient
        .from('DummyTable')
        .update({
          "description": description
        })
        .eq("name", name)
        .execute();
  }

  void deleteMovies(String name) async {
    final _response = await supabaseClient.from('DummyTable').delete().eq("name", name).execute();
  }

  void insertMovies(String name, String description) async {
    final _response = await supabaseClient.from('DummyTable').insert([
      {
        "name": name,
        "description": description,
      }
    ]).execute();
  }

  Future<List<Movie>> getMovies() async {
    final response = await supabaseClient.from('DummyTable').select('*').execute();

    final dataList = response.data as List;
    return dataList.map((map) => Movie.fromJson(map)).toList();
  }
}
