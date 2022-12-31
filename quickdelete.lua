local link;

hooksecurefunc(StaticPopupDialogs['DELETE_GOOD_ITEM'], 'OnShow', function (s)
  local edit = s.editBox
  local btn = s.button1

  if not link then
    link = s:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
    link:SetPoint('CENTER', edit)
    s:HookScript('OnHide', function(...) link:Hide(); end)
  end

  if (edit:IsShown()) then
    edit:Hide()
    link:SetText(select(3, GetCursorInfo()))
    link:Show()
    btn:Enable()
  end
end)
