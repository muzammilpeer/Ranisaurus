package com.ranisaurus.mobileapplication.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.Snackbar;
import android.support.design.widget.TextInputLayout;
import android.support.v4.view.MenuItemCompat;
import android.support.v7.widget.ShareActionProvider;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

import com.ranisaurus.baselayer.fragment.BaseFragment;
import com.ranisaurus.databaselayer.model.DBTaglines;
import com.ranisaurus.mobileapplication.R;
import com.ranisaurus.mobileapplication.config.Constants;
import com.ranisaurus.newtorklayer.enums.NetworkRequestEnum;
import com.ranisaurus.newtorklayer.manager.NetworkManager;
import com.ranisaurus.newtorklayer.models.TagLineCreateRequestModel;
import com.ranisaurus.newtorklayer.models.TagLineCreateResponseModel;
import com.ranisaurus.newtorklayer.requests.CreateTagLineRequest;
import com.ranisaurus.utilitylayer.logger.Log4a;
import com.ranisaurus.utilitylayer.network.GsonUtil;

import butterknife.Bind;

/**
 * Created by muzammilpeer on 8/30/15.
 */
public class TagLineDetailFragment extends BaseFragment {

    @Bind(R.id.tilTagLine)
    TextInputLayout tagLineTextInputLayout;

    @Bind(R.id.etTagLine)
    EditText tagLineEditText;

    @Bind(R.id.tilHowTo)
    TextInputLayout howToTextInputLayout;

    @Bind(R.id.etHowTo)
    EditText howToEditText;

    String tagLineID,tagLineTitle,tagLineHowTo;

    boolean isCreateMode = true;

    public TagLineDetailFragment() {
    }

    public static BaseFragment createInstance()
    {
        TagLineDetailFragment fragment = new TagLineDetailFragment();
        return fragment;
    }
    public static BaseFragment createInstance(DBTaglines taglines)
    {
        TagLineDetailFragment fragment = new TagLineDetailFragment();
        Bundle args = new Bundle();
        args.putString(Constants.TAG_LINE_ID,taglines.getTaglineId());
        args.putString(Constants.TAG_LINE_TITLE,taglines.getTagline());
        args.putString(Constants.TAG_LINE_HOW,taglines.getHowTo());
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        // TODO Add your menu entries here
        inflater.inflate(R.menu.menu_create_tagline, menu);
        if (isCreateMode == false)
        {
            menu.findItem(R.id.action_save).setVisible(false);
            menu.findItem(R.id.action_share).setVisible(true);
        }

        menu.findItem(R.id.action_search).setVisible(false);


        MenuItem shareItem = menu.findItem(R.id.action_share);
        ShareActionProvider mShareActionProvider = (ShareActionProvider) MenuItemCompat.getActionProvider(shareItem);
        Intent myIntent = new Intent();
        myIntent.setAction(Intent.ACTION_SEND);
        myIntent.putExtra(Intent.EXTRA_TEXT, tagLineTitle);
        myIntent.setType("text/plain");

        mShareActionProvider.setShareIntent(myIntent);
        super.onCreateOptionsMenu(menu, inflater);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();

        switch (id)
        {
            case R.id.action_save:
            {
                if (isCreateMode)
                {
                    if (tagLineEditText.getText() != null && tagLineEditText.getText().toString().length() > 0
                            && howToEditText.getText() != null  && howToEditText.getText().toString().length() > 0
                            )
                    {
                        AddTagLineData(tagLineEditText.getText().toString(),howToEditText.getText().toString());
                    }else {
                        Snackbar.make(mView,"Please provide the all fields.",Snackbar.LENGTH_SHORT).show();
                    }
                }else
                {
                    Snackbar.make(mView,"Saving",Snackbar.LENGTH_SHORT).show();
                }

            }break;
            case R.id.action_share :
            {
//                String shareBody = "testubg";
//                ShareActionProvider myShareActionProvider = (ShareActionProvider) MenuItemCompat.getActionProvider(item);
//
//                Intent myIntent = new Intent();
//                myIntent.setAction(Intent.ACTION_SEND);
//                myIntent.putExtra(Intent.EXTRA_TEXT, shareBody);
//                myIntent.setType("text/plain");
//
//                myShareActionProvider.setShareIntent(myIntent);

            }break;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        if (getArguments() != null)
        {
            tagLineID = getArguments().getString(Constants.TAG_LINE_ID);
            tagLineTitle = getArguments().getString(Constants.TAG_LINE_TITLE);
            tagLineHowTo = getArguments().getString(Constants.TAG_LINE_HOW);
            isCreateMode = false;
        }

        super.onCreateView(inflater, R.layout.fragment_tagline_detail);


        return mView;
    }

    @Override
    public void initViews() {
        super.initViews();
        getBaseActivity().showBackButton();
        getBaseActivity().setScreenTitle(R.string.title_detail);

        if (!isCreateMode)
        {
            tagLineEditText.setText(tagLineTitle);
            howToEditText.setText(tagLineHowTo);
            tagLineEditText.setEnabled(false);
            howToEditText.setEnabled(false);
        }

    }

    @Override
    public void initObjects() {
        super.initObjects();
    }

    @Override
    public void initListenerOrAdapter() {
        super.initListenerOrAdapter();
    }

    @Override
    public void initNetworkCalls() {
        super.initNetworkCalls();
    }

    // listener



    //Network Requests
    private void AddTagLineData(String txtTagline,String txtHowTo) {
        showLoader();
        TagLineCreateRequestModel model = new TagLineCreateRequestModel();
        model.setAction("addtagline");
        model.setTagline(txtTagline);
        model.setHowto(txtHowTo);
        CreateTagLineRequest request = new CreateTagLineRequest(model);

        try {
            NetworkManager.getInstance().executeRequest(request, this,
                    NetworkRequestEnum.CREATE_TAG_LINE);
        } catch (Exception e) {
            Log4a.printException(e);
        }
    }
    // listener


    @Override
    public void responseWithError(Exception error, NetworkRequestEnum requestType) {
        super.responseWithError(error, requestType);
        if (mView != null) {
            switch (requestType) {
                case CREATE_TAG_LINE: {
                    Snackbar.make(mView,"Add tagline due to network failed",Snackbar.LENGTH_SHORT).show();
                }
            }
        }
    }


    @Override
    public void successWithData(Object data, NetworkRequestEnum requestType) {
        super.successWithData(data, requestType);

        if (mView != null) {
            switch (requestType) {
                case CREATE_TAG_LINE: {
                    TagLineCreateResponseModel model = (TagLineCreateResponseModel) GsonUtil.getObjectFromJsonObject(data, TagLineCreateResponseModel.class);
                    Log4a.e("Webservice success", "Data  = " + model.toString());

                    if (model != null && model.getCode().equalsIgnoreCase("1")) {
                        Snackbar.make(mView,"Tagline saved successfully",Snackbar.LENGTH_SHORT).show();
                        getBaseActivity().popAllFragment();
                    }else {
                        Snackbar.make(mView,"Add tagline failed",Snackbar.LENGTH_SHORT).show();
                    }
                    //normal
                }
                break;

            }
        }
    }


}
