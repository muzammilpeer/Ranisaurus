package com.ranisaurus.mobileapplication.cell;

import android.view.View;
import android.widget.TextView;

import com.ranisaurus.baselayer.cell.BaseCell;
import com.ranisaurus.databaselayer.model.DBTaglines;
import com.ranisaurus.mobileapplication.R;
import com.ranisaurus.mobileapplication.fragment.TagLineDetailFragment;
import com.ranisaurus.utilitylayer.view.ResourceUtil;

import butterknife.Bind;

/**
 * Created by muzammilpeer on 8/30/15.
 */
public class TagLineCell extends BaseCell implements View.OnClickListener {
    @Bind(R.id.tv_tagline_row) TextView tvTitle;

    @Bind(R.id.tv_tagline_row_icon) TextView tvIcon;

    public TagLineCell(View itemView) {
        super(itemView);
        itemView.setOnClickListener(this);
    }

    @Override
    public void updateCell(Object model) {
        position = this.getAdapterPosition();

        mDataSource = model;
        DBTaglines data = (DBTaglines)mDataSource;

        tvIcon.setText(data.getTaglineIconName());
        tvIcon.setBackgroundDrawable(ResourceUtil.getCircularDrawable(itemView, position, getBaseActivity().getPackageName()));

        tvTitle.setText(data.getTagline());

    }


    @Override
    public void onClick(View v) {
        getBaseActivity().changeToolBarColorWithStatusBar((int)position);
        getBaseActivity().replaceFragment(TagLineDetailFragment.createInstance(((DBTaglines) mDataSource)), R.id.container_main);
    }

}

