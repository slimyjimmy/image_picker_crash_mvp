# image_picker_crash_mvp

Showcases a bug with image_picker (iOS)

## How to replicate the bug
1. Run app on iOS
2. Click "click here" button (to add an image)
3. Image should be added successfully
4. Click "click here" button again (you might have to scroll down a bit)
5. Now, when taking another photo, click the button which takes the photo (in the native screen produced by image_picker) twice in a row very fast (double-click, that is).
6. You then should get informed by the Fluttertoast that the `onTap` method of the underlying widget (GestureDetector) has been fired from the native screen (by double-clicking it)
7. Step 6 is confirmed when you select "Use photo" and are taken back - Because you are actually not really taken back but rather taken to another screen (Navigator.of(context).push in `onTap` of underlying widget again).

## My assumption
My assumption is that the second click in the native layer is being registered by the "old" screen that we initiated image_picker's `getImage` from. Whatever happens to be below the "take photo" button of the native layer, gets clicked.