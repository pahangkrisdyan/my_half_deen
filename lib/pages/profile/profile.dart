import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:tb_mhd/services/profile_netwoklayer.dart';
import 'package:tb_mhd/models/profile.dart';
import 'package:tb_mhd/models/user.dart';
import 'dart:convert';
import 'package:tb_mhd/services/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class Profiles extends StatefulWidget {
  String id;

  Profiles({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _ProfilesState();
}

class _ProfilesState extends State<Profiles> {

  String _id;
  String _nama;
  String _email;
  String _alamat;
  String _telepon;
  String _image;

  bool _isLoading = false;
  ApiService _apiService = ApiService();
  bool _isFieldNamaValid;
  bool _isFieldEmailValid;
  bool _isFieldAlamatValid;
  bool _isFieldTeleponValid;
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerAlamat = TextEditingController();
  TextEditingController _controllerTelepon = TextEditingController();

  //fungsi untuk mengambil data API (GET)
  _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    FirebaseUser user = await Auth().getCurrentUser();
    DocumentReference ref = Firestore.instance.collection("users").document(user.uid);
    print(ref.path);
    Firestore.instance.collection("users").document(user.uid).get()
    .catchError((err){
      throw Exception('Failed to load data');
    }).then((docSnap){
      var data = docSnap.data;
      print(data);
      User user = User(
        image: data['image'],
        alamat: data['address'],
        email: data['email'],
        id: docSnap.documentID,
        nama: data['name'],
        telepon: data['phoneNumber']
      );
      setState(() {
        _id = user.id;
        _nama = user.nama;
        _email = user.email;
        _alamat = user.alamat;
        _telepon = user.telepon;
        _image = user.image;
        _isLoading = false;
      });
      _isFieldNamaValid = true;
      _controllerNama.text = _nama;
      _isFieldEmailValid = true;
      _controllerEmail.text = _email;
      _isFieldAlamatValid = true;
      _controllerAlamat.text = _alamat;
      _isFieldTeleponValid = true;
      _controllerTelepon.text = _telepon;
    });
  }
  @override
  initState() {
    super.initState();
    // create our timer to generate test values
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldNama(),
                _buildTextFieldEmail(),
                _buildTextFieldAlamat(),
                _buildTextFieldTelepon(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    onPressed: () {
                      print('tes');
                      if (_isFieldNamaValid == null ||
                          _isFieldEmailValid == null ||
                          _isFieldAlamatValid == null ||
                          _isFieldTeleponValid == null ||
                          !_isFieldNamaValid ||
                          !_isFieldEmailValid ||
                          !_isFieldAlamatValid ||
                          !_isFieldTeleponValid) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      String id = _id;
                      String nama = _controllerNama.text.toString();
                      String email = _controllerEmail.text.toString();
                      String alamat = _controllerAlamat.text.toString();
                      String telepon = _controllerTelepon.text.toString();
                      String image = _image;
                      Profile profile =
                      Profile(id: id, nama: nama, email: email, alamat: alamat, telepon: telepon, image: image);
                      _apiService.updateProfile(profile).then((isSuccess) {
                        setState(() => _isLoading = false);
                        if (isSuccess) {
                          _scaffoldState.currentState.showSnackBar(SnackBar(
                            content: Text("Data berhasil diperbarui"),
                          ));
                          //Navigator.pop(_scaffoldState.currentState.context);
                        } else {
                          _scaffoldState.currentState.showSnackBar(SnackBar(
                            content: Text("Update data failed"),
                          ));
                        }
                      });
                    },
                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.pink[300],
                  ),
                )
              ],
            ),
          ),
          _isLoading?
            Center(
              child: CircularProgressIndicator(),
            )
            :
            Container()
        ],
      ),
    );
  }

  Widget _buildTextFieldNama() {
    return TextField(
      controller: _controllerNama,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Nama Lengkap",
        errorText: _isFieldNamaValid == null || _isFieldNamaValid
            ? null
            : "Full name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNamaValid) {
          setState(() => _isFieldNamaValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Email is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAlamat() {
    return TextField(
      controller: _controllerAlamat,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Alamat",
        errorText: _isFieldAlamatValid == null || _isFieldAlamatValid
            ? null
            : "Alamat is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAlamatValid) {
          setState(() => _isFieldAlamatValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldTelepon() {
    return TextField(
      controller: _controllerTelepon,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Telepon",
        errorText: _isFieldTeleponValid == null || _isFieldTeleponValid
            ? null
            : "Telepon is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldTeleponValid) {
          setState(() => _isFieldTeleponValid = isFieldValid);
        }
      },
    );
  }
}