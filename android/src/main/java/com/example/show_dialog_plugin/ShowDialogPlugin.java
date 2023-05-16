package com.example.show_dialog_plugin;

//import androidx.annotation.NonNull;


import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.view.WindowManager;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class ShowDialogPlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel channel;
    private Context context;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        context = flutterPluginBinding.getApplicationContext();
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "show_dialog_plugin");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);
        } else if (call.method.equals("showAlertDialog")) {
            AlertDialog.Builder builder = new AlertDialog.Builder(context);
            builder.setTitle("Alert");
            builder.setMessage("Hi, My name is Augustine");
            builder.setPositiveButton("OK", (dialog, which) -> {
                // Do something when OK button is clicked
            });
            AlertDialog dialog = builder.create();
            dialog.getWindow().setType(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !Settings.canDrawOverlays(context)) {
                Intent intent = new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
                intent.setData(Uri.parse("package:" + context.getPackageName()));
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            } else {
                dialog.show();
            }
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPlugin.FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}


// import io.flutter.embedding.engine.plugins.FlutterPlugin;
// import io.flutter.plugin.common.MethodCall;
// import io.flutter.plugin.common.MethodChannel;
// import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
// import io.flutter.plugin.common.MethodChannel.Result;
// import android.content.Context;
// import android.app.Activity;
// import android.app.Dialog;

// /** ShowDialogPlugin */
// public class ShowDialogPlugin implements FlutterPlugin, MethodCallHandler {
//   /// The MethodChannel that will the communication between Flutter and native Android
//   ///
//   /// This local reference serves to register the plugin with the Flutter Engine and unregister it
//   /// when the Flutter Engine is detached from the Activity
//   private MethodChannel channel;
//   private Context context;

//   @Override
//   public void onAttachedToEngine( FlutterPluginBinding flutterPluginBinding) {
//     context = flutterPluginBinding.getApplicationContext();
//     channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "show_dialog_plugin");
//     channel.setMethodCallHandler(this);
//   }

//   @Override
//   public void onMethodCall( MethodCall call,  Result result) {
//     if (call.method.equals("getPlatformVersion")) {
//       result.success("Android " + android.os.Build.VERSION.RELEASE);
//     }
//     else if(call.method.equalsIgnoreCase("showAlertDialog")) {

//       Dialog dialog = new Dialog(context);
//       dialog.setTitle("Hi, My Name is Flutter");
//       dialog.show();
//     }
//     else {
//       result.notImplemented();
//     }
//   }

//   @Override
//   public void onDetachedFromEngine(FlutterPluginBinding binding) {
//     channel.setMethodCallHandler(null);
//   }
// }
