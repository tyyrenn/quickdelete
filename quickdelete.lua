local link;

local function QuickDelete_OnShow(s)
  local edit = s.EditBox
  local btn = s.visibleButtons[1]

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
end

local dlg = StaticPopupDialogs['DELETE_GOOD_ITEM']
if dlg then
  local orig = dlg.OnShow
  dlg.OnShow = function(self, ...)
    if orig then orig(self, ...) end
    QuickDelete_OnShow(self, ...)
  end
end
