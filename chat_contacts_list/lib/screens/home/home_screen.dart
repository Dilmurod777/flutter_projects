import 'package:chat_contacts_list/data.dart';
import 'package:chat_contacts_list/modals/user.dart';
import 'package:chat_contacts_list/screens/home/components/chat/chat.dart';
import 'package:chat_contacts_list/screens/home/components/header/header.dart';
import 'package:chat_contacts_list/screens/home/components/recent_contacts/recent_contacts_slider.dart';
import 'package:chat_contacts_list/screens/home/components/search_bar/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<User> _contactsList = [];
  List<User> _searchedList = [];
  User _myProfileData;
  bool _showDetailedCount;
  TextEditingController _searchController;

  bool _showScrollEffect = false;
  bool _isScrollingDown = false;
  ScrollController _scrollController = new ScrollController();

  Animation<double> _sliderAnimation;
  AnimationController _sliderAnimationController;

  onSearchChangedHandler(value) {
    if (value == '') {
      this.setState(() {
        _searchedList = _contactsList;
      });
    } else {
      final firstNameSearch = _contactsList
          .where((contact) => contact.firstName.toLowerCase().contains(value))
          .toList();
      final lastNameSearch = _contactsList
          .where((contact) => contact.lastName.toLowerCase().contains(value))
          .toList();
      final lastMessageSearch = _contactsList
          .where((contact) =>
              contact.history.last.text.toLowerCase().contains(value))
          .toList();

      this.setState(() {
        _searchedList = [
          ...firstNameSearch,
          ...lastNameSearch,
          ...lastMessageSearch
        ].toSet().toList();
      });
    }
  }

  setShowDetailedCount(value) {
    this.setState(() {
      _showDetailedCount = value;
    });
  }

  myScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          scrollDownEffect();
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          scrollUpEffect();
        }
      }
    });
  }

  scrollDownEffect() {
    this.setState(() {
      _isScrollingDown = true;
      _showScrollEffect = true;
    });

    _sliderAnimationController.forward();
  }

  scrollUpEffect() {
    this.setState(() {
      _isScrollingDown = false;
      _showScrollEffect = false;
    });
    _sliderAnimationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    this._contactsList = contacts;
    this._searchedList = contacts;
    this._myProfileData = myProfile;
    _showDetailedCount = false;
    _searchController = TextEditingController();

    _sliderAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _sliderAnimation =
        Tween<double>(begin: 1, end: 0).animate(_sliderAnimationController)
          ..addListener(() {
            setState(() {});
          });

    myScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _sliderAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 44),
        child: Column(
          children: <Widget>[
            Header(animation: _sliderAnimation),
            RecentContactsSlider(
                showScrollEffect: _showScrollEffect,
                contacts: this._contactsList,
                myProfile: this._myProfileData,
                sliderAnimation: _sliderAnimation),
            SearchBar(
                contacts: this._contactsList,
                showDetailedCount: this._showDetailedCount,
                setShowDetailedCount: this.setShowDetailedCount,
                searchController: this._searchController,
                onSearchChange: this.onSearchChangedHandler),
            Chat(
              contacts: this._searchedList,
              scrollController: _scrollController,
              scrollUpEffect: scrollUpEffect,
              showScrollEffect: _showScrollEffect,
            )
          ],
        ),
      ),
    );
  }
}
