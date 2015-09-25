package com.dogabi.cordova;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONArray;
import org.json.JSONException;

import android.content.Context;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.inputmethod.InputMethodManager;

public class ShareSDK extends CordovaPlugin{

    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);

        DisplayMetrics dm = new DisplayMetrics();
        cordova.getActivity().getWindowManager().getDefaultDisplay().getMetrics(dm);
        final float density = dm.density;
        final CordovaWebView appView = webView;
        final View rootView = cordova.getActivity().getWindow().getDecorView().findViewById(android.R.id.content).getRootView();
    }

    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if ("share".equals(action)) {
            cordova.getThreadPool().execute(new Runnable() {
                public void run() {
                    //do your magic

                    if (v == null) {
                        callbackContext.error("No current focus");
                    } else {
                        callbackContext.success(); // Thread-safe.
                    }
                }
            });
            return true;
        }
        return false;  // Returning false results in a "MethodNotFound" error.
    }

/*
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext)
      throws JSONException {
    if (action.equals("alert")) {
      alert(args.getString(0), args.getString(1), args.getString(2), callbackContext);
      return true;
    }
    return false;
  }
*/

}