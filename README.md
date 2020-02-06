# Event_list

A Flutter application to display events from the open Ticketmaster API V2.

## Getting it to work

1. Checkout the repository (clone or download zip).
2. Add an assets folder on the top level (below the "basic_scrolllist" folder).
3. Add a "token.json" file. This file should contain the following code:
 ```json
 {
   "token": "###YOUR_API_KEY_HERE###"
 }
 ```
4. Register a Ticketmaster developer account. (<https://developer-acct.ticketmaster.com/user/register>)
5. Create an app and copy the generated public api key to the json.
6. Go to the pubspec.yaml and click the pub get button or run "flutter pub get" in the terminal.
7. Your good to go! :-) 
   Depending on your setup, e.g. connect an iPhone to the computer, select it in Android Studio or similar and run it there.
   Or, start the application via "flutter run".
