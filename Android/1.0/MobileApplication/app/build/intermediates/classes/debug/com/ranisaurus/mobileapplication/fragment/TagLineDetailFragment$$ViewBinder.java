// Generated code from Butter Knife. Do not modify!
package com.ranisaurus.mobileapplication.fragment;

import android.view.View;
import butterknife.ButterKnife.Finder;
import butterknife.ButterKnife.ViewBinder;

public class TagLineDetailFragment$$ViewBinder<T extends com.ranisaurus.mobileapplication.fragment.TagLineDetailFragment> implements ViewBinder<T> {
  @Override public void bind(final Finder finder, final T target, Object source) {
    View view;
    view = finder.findRequiredView(source, 2131492975, "field 'tagLineTextInputLayout'");
    target.tagLineTextInputLayout = finder.castView(view, 2131492975, "field 'tagLineTextInputLayout'");
    view = finder.findRequiredView(source, 2131492976, "field 'tagLineEditText'");
    target.tagLineEditText = finder.castView(view, 2131492976, "field 'tagLineEditText'");
    view = finder.findRequiredView(source, 2131492977, "field 'howToTextInputLayout'");
    target.howToTextInputLayout = finder.castView(view, 2131492977, "field 'howToTextInputLayout'");
    view = finder.findRequiredView(source, 2131492978, "field 'howToEditText'");
    target.howToEditText = finder.castView(view, 2131492978, "field 'howToEditText'");
  }

  @Override public void unbind(T target) {
    target.tagLineTextInputLayout = null;
    target.tagLineEditText = null;
    target.howToTextInputLayout = null;
    target.howToEditText = null;
  }
}
