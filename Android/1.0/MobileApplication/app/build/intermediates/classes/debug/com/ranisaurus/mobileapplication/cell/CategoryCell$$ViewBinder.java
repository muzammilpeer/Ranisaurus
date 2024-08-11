// Generated code from Butter Knife. Do not modify!
package com.ranisaurus.mobileapplication.cell;

import android.view.View;
import butterknife.ButterKnife.Finder;
import butterknife.ButterKnife.ViewBinder;

public class CategoryCell$$ViewBinder<T extends com.ranisaurus.mobileapplication.cell.CategoryCell> implements ViewBinder<T> {
  @Override public void bind(final Finder finder, final T target, Object source) {
    View view;
    view = finder.findRequiredView(source, 2131492995, "field 'tvTitle'");
    target.tvTitle = finder.castView(view, 2131492995, "field 'tvTitle'");
    view = finder.findRequiredView(source, 2131492994, "field 'tvIcon'");
    target.tvIcon = finder.castView(view, 2131492994, "field 'tvIcon'");
  }

  @Override public void unbind(T target) {
    target.tvTitle = null;
    target.tvIcon = null;
  }
}
