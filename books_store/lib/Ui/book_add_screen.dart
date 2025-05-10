import 'package:books_store/Bloc/Get/bookstore2_bloc.dart';
import 'package:books_store/Bloc/Post/bookstore1_bloc.dart';
import 'package:books_store/Bloc/Put/bookstore3_bloc.dart';
import 'package:books_store/Repository/model/book-store1.dart';
import 'package:books_store/Repository/model/book-store2.dart';
import 'package:books_store/Repository/model/book-store3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAddScreen extends StatefulWidget {
  final Data? bookData;

  const BookAddScreen({super.key, this.bookData});

  @override
  State<BookAddScreen> createState() => _BookAddScreenState();
}

class _BookAddScreenState extends State<BookAddScreen> {
  late Bookstoremodel1 bookstoremodel1;
  late Bookstoremodel3 bookstoremodel3;
  final title = TextEditingController();
  final author = TextEditingController();
  final publishYear = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.bookData != null) {
      // If editing, prefill the fields
      title.text = widget.bookData!.title.toString();
      author.text = widget.bookData!.author.toString();
      publishYear.text = widget.bookData!.publishYear.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.bookData == null ? 'Add Book' : 'Edit Book',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                TextFormField(
                  controller: title,

                  decoration: const InputDecoration(
                    labelText: 'title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid Title!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: author,
                  decoration: const InputDecoration(
                    labelText: 'author',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid author!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: publishYear,
                  decoration: const InputDecoration(
                    labelText: 'publishyear',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a valid publishyear!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 100),
                widget.bookData == null
                    ? BlocListener<Bookstore1Bloc, Bookstore1State>(
                      listener: (context, state) {
                        if (state is Bookstore1loading) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(child: CircularProgressIndicator());
                            },
                          );
                        }
                        if (state is Bookstore1error) {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: Text(
                                  'Something Wrong',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          );
                        }
                        if (state is Bookstore1loaded) {
                          bookstoremodel1 =
                              BlocProvider.of<Bookstore1Bloc>(
                                context,
                              ).bookstoremodel1;

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          BlocProvider.of<Bookstore2Bloc>(
                            context,
                          ).add(Fetchbookstore());
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<Bookstore1Bloc>(context).add(
                              Postbookstore(
                                title: title.text,
                                author: author.text,
                                publishYear: int.parse(publishYear.text),
                              ),
                            );
                          }
                          print('create');
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              'Create',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    : BlocListener<Bookstore3Bloc, Bookstore3State>(
                      listener: (context, state) {
                        if (state is Bookstore3loading) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(child: CircularProgressIndicator());
                            },
                          );
                        }
                        if (state is Bookstore3error) {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: Text(
                                  'Something Wrong',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          );
                        }
                        if (state is Bookstore3loaded) {
                          bookstoremodel3 =
                              BlocProvider.of<Bookstore3Bloc>(
                                context,
                              ).bookstoremodel3;

                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          BlocProvider.of<Bookstore2Bloc>(
                            context,
                          ).add(Fetchbookstore());
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<Bookstore3Bloc>(context).add(
                              Updatebookstore(
                                title: title.text,
                                author: author.text,
                                publishYear: int.parse(publishYear.text),
                                id: widget.bookData!.id.toString(),
                              ),
                            );
                          }
                          print('update');
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              'Update',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
