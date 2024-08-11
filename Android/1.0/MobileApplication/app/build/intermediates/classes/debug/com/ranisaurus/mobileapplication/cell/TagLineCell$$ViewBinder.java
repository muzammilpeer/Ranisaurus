// Generated code from Butter Knife. Do not modify!
package com.ranisaurus.mobileapplication.cell;

import android.view.View;
import butterknife.ButterKnife.Finder;
import butterknife.ButterKnife.ViewBinder;

public class TagLineCell$$ViewBinder<T extends com.ranisaurus.mobileapplication.cell.TagLineCell> implements ViewBinder<T> {
  @Override public void bind(final Finder finder, final T target, Object source) {
    View view;
    view = finder.findRequiredView(source, 2131492997, "field 'tvTitle'");
    target.tvTitle = finder.castView(view, 2131492997, "field 'tvTitle'");
    view = finder.findRequiredView(source, 2131492996, "field 'tvIcon'");
    target.tvIcon = finder.castView(view, 2131492996, "field 'tvIcon'");
  }

  @Override public void unbind(T target) {
    target.tvTitle = null;
    target.tvIcon = null;
  }
}
