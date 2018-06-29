package deeplinks;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;

import android.content.Intent;
import android.net.Uri;

public class DeeplinkPlugin extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) {

        if (action.equals("getDeeplink")) {
            this.getUriFromIntent(callbackContext);
            return true;
        }

        if (action.equals("onDeepLink")) {
            callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, ""));
            return true;
        }

        return false;
    }

    private void getUriFromIntent (final CallbackContext context) {
        String resultUri = "";
        Intent intent = cordova.getActivity().getIntent();
        Uri uri = intent.getData();
        if(uri != null) {
            resultUri = uri.toString();
        }
        context.sendPluginResult(new PluginResult(PluginResult.Status.OK, resultUri));
    }
}
