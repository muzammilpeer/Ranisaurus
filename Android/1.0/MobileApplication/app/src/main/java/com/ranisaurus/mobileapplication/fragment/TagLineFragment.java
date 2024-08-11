package com.ranisaurus.mobileapplication.fragment;

import android.os.Bundle;
import android.os.Handler;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.ranisaurus.baselayer.adapter.GeneralBaseAdapter;
import com.ranisaurus.baselayer.fragment.BaseFragment;
import com.ranisaurus.databaselayer.factory.ServiceFactory;
import com.ranisaurus.databaselayer.model.DBCategories;
import com.ranisaurus.databaselayer.model.DBTaglines;
import com.ranisaurus.databaselayer.service.ITaglinesService;
import com.ranisaurus.mobileapplication.R;
import com.ranisaurus.mobileapplication.cell.TagLineCell;
import com.ranisaurus.mobileapplication.config.Constants;
import com.ranisaurus.newtorklayer.enums.NetworkRequestEnum;
import com.ranisaurus.newtorklayer.manager.NetworkManager;
import com.ranisaurus.newtorklayer.models.TagLineCategoryRequestModel;
import com.ranisaurus.newtorklayer.models.TagLineCategoryResponseModel;
import com.ranisaurus.newtorklayer.models.Taglines;
import com.ranisaurus.newtorklayer.requests.TagLineListRequest;
import com.ranisaurus.utilitylayer.logger.Log4a;
import com.ranisaurus.utilitylayer.network.GsonUtil;

import java.util.ArrayList;
import java.util.List;

import butterknife.Bind;

/**
 * Created by muzammilpeer on 8/30/15.
 */
public class TagLineFragment extends BaseFragment {

    @Bind(R.id.srl_taglines)
    SwipeRefreshLayout categoriesSwipeRefreshLayout;

    @Bind(R.id.rv_taglines)
    RecyclerView categoriesRecyclerView;

    GeneralBaseAdapter<TagLineCell> categoryAdapter;

    String categoryID = "";

    public TagLineFragment() {
    }

    public static BaseFragment createInstance(Object category)
    {
        DBCategories model = (DBCategories)category;
        TagLineFragment fragment = new TagLineFragment();
        Bundle args = new Bundle();
        args.putString(Constants.TAG_LINE_CATEGORY_ID,model.getCategoryId());
        fragment.setArguments(args);
        return fragment;
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        if (getArguments() != null)
        {
            categoryID = getArguments().getString(Constants.TAG_LINE_CATEGORY_ID);
        }

        super.onCreateView(inflater, R.layout.fragment_tagline);


        return mView;
    }

    @Override
    public void initViews() {
        super.initViews();
        getBaseActivity().showBackButton();
        getBaseActivity().setScreenTitle(R.string.title_taglines);

    }

    @Override
    public void initObjects() {
        super.initObjects();

    }

    @Override
    public void initListenerOrAdapter() {
        super.initListenerOrAdapter();


        final LinearLayoutManager layoutManager = new LinearLayoutManager(mContext);
        categoriesRecyclerView.setLayoutManager(layoutManager);
        categoryAdapter = new GeneralBaseAdapter<TagLineCell>(mContext,R.layout.row_tagline,TagLineCell.class,this.getLocalDataSource());
        categoriesRecyclerView.setAdapter(categoryAdapter);


        categoriesSwipeRefreshLayout.setColorSchemeResources(R.color.icon_color_0, R.color.icon_color_8, R.color.icon_color_5);
        categoriesSwipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        if (categoryID != null && categoryID.length() > 0) {
                            showHideSwipyRefresh(true);
                            getListData(categoryID);
                        }
                        ;
                    }
                }, 2500);
            }
        });

    }

    @Override
    public void initNetworkCalls() {
        super.initNetworkCalls();



        try {
            ITaglinesService service =
                    (ITaglinesService) ServiceFactory.getInstance().getService(ITaglinesService.class.getName());

            if (categoryID != null && categoryID.length() > 0) {
                if (service.getTaglinesCount(categoryID) == 0) {
                    showLoader();
                    getListData(categoryID);
                } else {
                    refreshCategoriesListFromDatabase();
                }
            }

        }catch (Exception e)
        {
            Log4a.printException(e);
        }

    }
    private void refreshCategoriesListFromDatabase()
    {
        try {
            ITaglinesService service =
                    (ITaglinesService) ServiceFactory.getInstance().getService(ITaglinesService.class.getName());

            this.getLocalDataSource().addAll(service.getAllTaglines(categoryID));
            showHideSwipyRefresh(false);
            if (categoryAdapter != null)
            {
                categoryAdapter.notifyDataSetChanged();
            }
        }catch (Exception e)
        {
            Log4a.printException(e);
        }
    }

    //
    private void showHideSwipyRefresh(boolean isShow)
    {
        if (categoriesSwipeRefreshLayout != null)
        {
            categoriesSwipeRefreshLayout.setRefreshing(isShow);
        }
    }

    //Network Requests
    private void getListData(String categoryID) {
        TagLineCategoryRequestModel model = new TagLineCategoryRequestModel();
        model.setAction("gettagline");
        model.setCategoryid(categoryID);
        TagLineListRequest request = new TagLineListRequest(model);

        try {
            NetworkManager.getInstance().executeRequest(request, this,
                    NetworkRequestEnum.TAG_LINE_LIST);
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
                case TAG_LINE_LIST: {
                    showHideSwipyRefresh(false);
                }
            }
        }
    }


    @Override
    public void successWithData(Object data, NetworkRequestEnum requestType) {
        super.successWithData(data, requestType);

        if (mView != null) {
            switch (requestType) {
                case TAG_LINE_LIST: {
                    TagLineCategoryResponseModel model = (TagLineCategoryResponseModel) GsonUtil.getObjectFromJsonObject(data, TagLineCategoryResponseModel.class);

                    if (model != null) {
                        if (model.getTaglines().size() > 0 )
                        {
                            this.getLocalDataSource().clear();
                            try {
                                ITaglinesService service =
                                        (ITaglinesService) ServiceFactory.getInstance().getService(ITaglinesService.class.getName());
                                List<DBTaglines> responseList =  new ArrayList<DBTaglines>();
                                for (Taglines dataModel : model.getTaglines())
                                {
                                    responseList.add(new DBTaglines(dataModel,categoryID));
                                }
                                service.saveAllTaglines(responseList, categoryID);
                            }catch (Exception e)
                            {
                                Log4a.printException(e);
                            }
                            //refresh the list from database
                            refreshCategoriesListFromDatabase();

                        }

                    }
                }
                break;

            }
        }
    }
}
