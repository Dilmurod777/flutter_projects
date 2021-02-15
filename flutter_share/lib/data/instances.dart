import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_share/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

User currentUser;

CollectionReference timelineRef;
CollectionReference usersRef;
CollectionReference postsRef;
CollectionReference commentsRef;
CollectionReference activityFeedRef;
CollectionReference followersRef;
CollectionReference followingRef;
Reference storageRef;

GoogleSignIn googleSignIn;