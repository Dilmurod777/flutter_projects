const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.onCreateFollower = functions.firestore
    .document("/followers/{userId}/userFollowers/{followerId}")
    .onCreate(async (snapshot, context) => {
        const userId = context.params.userId;
        const followerId = context.params.followerId;

        // get followed users posts
        const followedUserPostsRef = admin.firestore()
            .collection('posts')
            .doc(userId)
            .collection('userPosts');

        // create following user's timeline ref
        const timelinePostsRef = admin.firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('timelinePosts');

        // get following user's posts
        const querySnapshot = await followedUserPostsRef.get();

        // add each user posts to following user's timeline
        querySnapshot.forEach(doc => {
            if (doc.exists) {
                const postId = doc.id;
                const postData = doc.data();

                timelinePostsRef.doc(postId).set(postData)
            }
        });
    });

exports.onDeleteFollower = functions.firestore
    .document("/followers/{userId}/userFollowers/{followerId}")
    .onDelete(async (snapshot, context) => {
        const userId = context.params.userId;
        const followerId = context.params.followerId;

        const timelinePostsRef = admin.firestore()
            .collection('timeline')
            .doc(followerId)
            .collection('timelinePosts')
            .where('ownerId', '==', userId);

        const querySnapshot = await timelinePostsRef.get();
        querySnapshot.forEach(doc => {
            if (doc.exists) {
                doc.ref.delete();
            }
        });
    })

exports.onCreatePost = functions.firestore
    .document('/posts/{userId}/userPosts/{postId}')
    .onCreate(async (snapshot, context) => {
        const postCreated = snapshot.data()
        const userId = context.params.userId;
        const postId = context.params.postId;

        // get all the followers of the user who made the post
        const userFollowersRef = admin.firestore()
            .collection('followers')
            .doc(userId)
            .collection('userFollowers');

        const querySnapshot = await userFollowersRef.get();

        // add new post to each followers timeline
        querySnapshot.forEach(doc => {
            if (doc.exists) {
                const followerId = doc.id;
                admin.firestore()
                    .collection('timeline')
                    .doc(followerId)
                    .collection('timelinePosts')
                    .doc(postId)
                    .set(postCreated);
            }
        })
    });

exports.onUpdatePost = functions.firestore
    .document('/posts/{userId}/userPosts/{postId}')
    .onUpdate(async (change, context) => {
        const postUpdated = change.after.data();
        const userId = context.params.userId;
        const postId = context.params.postId;

        // get all the followers of the user who made the post
        const userFollowersRef = admin.firestore()
            .collection('followers')
            .doc(userId)
            .collection('userFollowers');

        const querySnapshot = await userFollowersRef.get();

        // update each post in each followers timeline
        querySnapshot.forEach(doc => {
            const followerId = doc.id;
            admin.firestore()
                .collection('timeline')
                .doc(followerId)
                .collection('timelinePosts')
                .doc(postId)
                .get().then(doc => {
                if (doc.exists) {
                    doc.ref.update(postUpdated);
                }
            });
        })
    });

exports.onDeletePost = functions.firestore
    .document('/posts/{userId}/userPosts/{postId}')
    .onDelete(async (snapshot, context) => {
        const userId = context.params.userId;
        const postId = context.params.postId;

        // get all the followers of the user who made the post
        const userFollowersRef = admin.firestore()
            .collection('followers')
            .doc(userId)
            .collection('userFollowers');

        const querySnapshot = await userFollowersRef.get();

        // delete each post in each followers timeline
        querySnapshot.forEach(doc => {
            const followerId = doc.id;
            admin.firestore()
                .collection('timeline')
                .doc(followerId)
                .collection('timelinePosts')
                .doc(postId)
                .get().then(doc => {
                if (doc.exists) {
                    doc.ref.delete();
                }
            });
        })
    });

exports.onCreateActvityFeedItem = functions.firestore
    .document("/feed/{userId}/feedItems/{activityFeedItem}")
    .onCreate(async (snapshot, context) => {
        // get user connected to feed
        const userId = context.params.userId

        const userRef = admin.firestore()
            .doc(`users/${userId}`);
        const doc = await userRef.get();

        // check if user has notification token
        const androidNotificationToken = doc.data().androidNotificationToken;
        const activityFeedItem = snapshot.data()

        if (androidNotificationToken) {
            // send notification
            sendNotification(androidNotificationToken, activityFeedItem)
        } else {
            console.log('No token for user. Cannot send notification');
        }

        function sendNotification(androidNotificationToken, activityFeedItem) {
            let body;

            // switch body value based on notification type
            switch (activityFeedItem.type) {
                case 'comment':
                    body = `${activityFeedItem.username} replied: ${activityFeedItem.commentData}`;
                    break;
                case 'like':
                    body = `${activityFeedItem.username} liked your post`;
                    break;
                case 'follow':
                    body = `${activityFeedItem.username} started following you`
                    break;
                default:
                    break;
            }

            // create message for push notification
            const message = {
                notification: {body},
                token: androidNotificationToken,
                data: {recipient: userId}
            };

            // send message
            admin.messaging().send(message).then(response => {
                console.log("Message sent response: ", response)
            }).catch(error => {
                console.log("Message error: ", error)
            });
        }
    })