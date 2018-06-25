package deeplinks;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import android.content.Intent;
import android.net.Uri;


/**
 * This class echoes a string called from JavaScript.
 */
public class DeeplinkWrapper extends CordovaPlugin {


    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("coolMethod")) {
            String message = args.getString(0);
            this.coolMethod(message, callbackContext);
            return true;
        }
        if (action.equals("getUriFromIntent")) {
            this.getUriFromIntent(callbackContext);
            return true;
        }


        return false;
    }

    private void getUriFromIntent (final CallbackContext context) {
        String resultUri = null;
        Intent intent = cordova.getActivity().getIntent();
        Uri uri = intent.getData();
            if(uri!=null)
                resultUri = uri.toString();
        context.sendPluginResult(new PluginResult(PluginResult.Status.OK, resultUri));
    }

    private void coolMethod(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }
}
