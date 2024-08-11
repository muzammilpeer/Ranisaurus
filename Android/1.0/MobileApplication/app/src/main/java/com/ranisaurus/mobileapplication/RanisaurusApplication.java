package com.ranisaurus.mobileapplication;

import android.app.Application;

import com.orm.SugarContext;

/**
 * Created by muzammilpeer on 9/6/15.
 */
public class RanisaurusApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        SugarContext.init(getApplicationContext());
    }

    @Override
    public void onTerminate() {
        super.onTerminate();
        SugarContext.terminate();
    }
}
