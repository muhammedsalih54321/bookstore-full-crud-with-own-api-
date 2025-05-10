import 'package:books_store/Bloc/Delete/bookstrore4_bloc.dart';
import 'package:books_store/Bloc/Get/bookstore2_bloc.dart';
import 'package:books_store/Repository/model/book-store2.dart';
import 'package:books_store/Repository/model/book-store3.dart';
import 'package:books_store/Repository/model/book-store4.dart';
import 'package:books_store/Ui/book_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Bookstoremodel2 bookstoremodel2;
  late Bookstoremodel3 bookstoremodel3;
  late Bookstoremodel4 bookstoremodel4;
  @override
  void initState() {
    BlocProvider.of<Bookstore2Bloc>(context).add(Fetchbookstore());

    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Store',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: BlocBuilder<Bookstore2Bloc, Bookstore2State>(
        builder: (context, state) {
          if (state is Bookstore2loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is Bookstore2error) {
            return RefreshIndicator(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .9,
                  child: const Center(child: Text('Oops something went wrong')),
                ),
              ),
              onRefresh: () async {
                return BlocProvider.of<Bookstore2Bloc>(
                  context,
                ).add(Fetchbookstore());
              },
            );
          }
          if (state is Bookstore2loaded) {
            bookstoremodel2 =
                BlocProvider.of<Bookstore2Bloc>(context).bookstoremodel2;
            return ListView.builder(
              itemCount: bookstoremodel2.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    bookstoremodel2.data![index].title.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bookstoremodel2.data![index].author.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),

                      Text(
                        "publishyear : ${bookstoremodel2.data![index].publishYear.toString()}",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      PopupMenuButton<int>(
                        itemBuilder:
                            (context) => [
                              // PopupMenuItem 1
                              PopupMenuItem(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => BookAddScreen(
                                            bookData:
                                                bookstoremodel2.data![index],
                                          ),
                                    ),
                                  );
                                },
                                value: 1,
                                // row with 2 children
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit),
                                    const SizedBox(width: 10),
                                    const Text("Edit"),
                                  ],
                                ),
                              ),
                              // PopupMenuItem 2
                              PopupMenuItem(
                                onTap: () {},
                                value: 2,
                                // row with two children
                                child: BlocListener<
                                  Bookstore4Bloc,
                                  Bookstore4State
                                >(
                                  listener: (context, state) {
                                    if (state is Bookstore4loading) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                    }
                                    if (state is Bookstore4error) {
                                      Navigator.of(context).pop();
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: Text(
                                              'Something Wrong',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                    if (state is Bookstore4loaded) {
                                      bookstoremodel4 =
                                          BlocProvider.of<Bookstore4Bloc>(
                                            context,
                                          ).bookstoremodel4;
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                      BlocProvider.of<Bookstore2Bloc>(
                                        context,
                                      ).add(Fetchbookstore());

                                      _showSnackBar('succesfully Deleted');
                                    }
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<Bookstore4Bloc>(
                                        context,
                                      ).add(
                                        Deletebookstore(
                                          id:
                                              bookstoremodel2.data![index].id
                                                  .toString(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        const Icon(Icons.delete),
                                        const SizedBox(width: 10),
                                        const Text("Delete"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],

                        color: Colors.white,
                        // on selected we show the dialog box
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Book Vot found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookAddScreen()),
          );
        },
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF5856D6),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {},
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 1.29,
            letterSpacing: -0.41,
          ),
        ),
      ),
    );
  }
}
