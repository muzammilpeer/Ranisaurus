package com.ranisaurus.mobileapplication.activity;

import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import com.ranisaurus.baselayer.activity.BaseActivity;
import com.ranisaurus.mobileapplication.R;
import com.ranisaurus.mobileapplication.fragment.MainFragment;
import com.ranisaurus.utilitylayer.view.ResourceUtil;
import com.ranisaurus.utilitylayer.view.ToolBarUtil;

public class MainActivity extends BaseActivity {

    Toolbar mainToolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //setup toolbar
        mainToolbar = (Toolbar) findViewById(R.id.tb_main_toolbar);
        setSupportActionBar(mainToolbar);
        mainToolbar.setTitleTextColor(0xFFFFFFFF);

        setupActivity();

        //setup first screen
        MainFragment fragment = new MainFragment();
        addFragment(fragment, R.id.container_main);


    }

    @Override
    public void initViews() {
        super.initViews();

//        setSupportActionBar(mainToolbar);
    }

    @Override
    public void initListenerOrAdapter() {
        super.initListenerOrAdapter();


        mainToolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onBackPressed();
            }
        });
    }

    @Override
    public void initObjects() {
        super.initObjects();
    }

    @Override
    public void changeToolBarColorWithStatusBar(int color) {
        super.changeToolBarColorWithStatusBar(color);
        mainToolbar.setBackgroundColor(getResources().getColor(ResourceUtil.getCircularColorResourceID(this, color, getPackageName())));
        ToolBarUtil.changeStatusBarColor(getWindow(), getResources().getColor(ResourceUtil.getStatusBarColorResourceID(this, color, getPackageName())));
    }

    @Override
    public void restoreToolBarColorWithStatusBar() {
        super.restoreToolBarColorWithStatusBar();
        mainToolbar.setBackgroundColor(getResources().getColor(R.color.primary));
        ToolBarUtil.changeStatusBarColor(getWindow(), getResources().getColor(R.color.primary_dark));
    }

    @Override
    public void setScreenTitle(int title) {
        super.setScreenTitle(title);
        getSupportActionBar().setTitle(getString(title));
    }


    @Override
    public void showBackButton() {
        super.showBackButton();
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    public void hideBackButton() {
        super.hideBackButton();
        getSupportActionBar().setDisplayHomeAsUpEnabled(false);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        return super.onOptionsItemSelected(item);
    }
}
