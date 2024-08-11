// Generated code from Butter Knife. Do not modify!
package com.ranisaurus.mobileapplication.fragment;

import android.view.View;
import butterknife.ButterKnife.Finder;
import butterknife.ButterKnife.ViewBinder;

public class TagLineFragment$$ViewBinder<T extends com.ranisaurus.mobileapplication.fragment.TagLineFragment> implements ViewBinder<T> {
  @Override public void bind(final Finder finder, final T target, Object source) {
    View view;
    view = finder.findRequiredView(source, 2131492973, "field 'categoriesSwipeRefreshLayout'");
    target.categoriesSwipeRefreshLayout = finder.castView(view, 2131492973, "field 'categoriesSwipeRefreshLayout'");
    view = finder.findRequiredView(source, 2131492974, "field 'categoriesRecyclerView'");
    target.categoriesRecyclerView = finder.castView(view, 2131492974, "field 'categoriesRecyclerView'");
  }

  @Override public void unbind(T target) {
    target.categoriesSwipeRefreshLayout = null;
    target.categoriesRecyclerView = null;
  }
}
