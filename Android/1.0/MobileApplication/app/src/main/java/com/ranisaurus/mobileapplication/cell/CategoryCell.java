package com.ranisaurus.mobileapplication.cell;

import android.view.View;
import android.widget.TextView;

import com.ranisaurus.baselayer.cell.BaseCell;
import com.ranisaurus.databaselayer.model.DBCategories;
import com.ranisaurus.mobileapplication.R;
import com.ranisaurus.mobileapplication.fragment.TagLineFragment;
import com.ranisaurus.utilitylayer.view.ResourceUtil;

import butterknife.Bind;

/**
 * Created by muzammilpeer on 8/30/15.
 */
public class CategoryCell extends BaseCell implements View.OnClickListener{
    @Bind(R.id.tv_category_row) TextView tvTitle;

    @Bind(R.id.tv_category_row_icon) TextView tvIcon;


    public CategoryCell(View itemView) {
        super(itemView);
        itemView.setOnClickListener(this);
    }

    @Override
    public void updateCell(Object model) {
        position = this.getAdapterPosition();

        mDataSource = model;
        DBCategories data = (DBCategories)mDataSource;

        tvIcon.setText(data.getCategoryIconName());
        tvIcon.setBackgroundDrawable(ResourceUtil.getCircularDrawable(itemView, position, getBaseActivity().getPackageName()));

        tvTitle.setText(data.getCategory());
    }

    @Override
    public void onClick(View v) {
        getBaseActivity().changeToolBarColorWithStatusBar((int) position);
        getBaseActivity().replaceFragment(TagLineFragment.createInstance(mDataSource), R.id.container_main);
    }

}

