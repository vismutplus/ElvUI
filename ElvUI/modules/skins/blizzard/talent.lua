local E, L, V, P, G = unpack(select(2, ...));
local S = E:GetModule("Skins");

local _G = _G;

local function LoadSkin()
	if(E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.talent ~= true) then return; end

	PlayerTalentFrame:StripTextures(true);
	PlayerTalentFrame:CreateBackdrop("Transparent");
	PlayerTalentFrame.backdrop:Point("TOPLEFT", 13, -12);
	PlayerTalentFrame.backdrop:Point("BOTTOMRIGHT", -31, 76);

	S:HandleCloseButton(PlayerTalentFrameCloseButton);

	PlayerTalentFrameStatusFrame:StripTextures();
	PlayerTalentFrameStatusFrame:Point("TOPLEFT", PlayerTalentFrame, "TOPLEFT", 57, -40)
	PlayerTalentFrameStatusFrame:HookScript("OnShow", function(self)
		if(GlyphFrame and GlyphFrame:IsShown()) then
			self:Hide();
		end
	end);

	S:HandleButton(PlayerTalentFrameActivateButton, true);
	PlayerTalentFrameActivateButton:Point("TOP", PlayerTalentFrame, "TOP", 0, -40)
	PlayerTalentFrameActivateButton:HookScript("OnShow", function(self)
		if(GlyphFrame and GlyphFrame:IsShown()) then
			self:Hide();
		end
	end);

	PlayerTalentFramePointsBar:StripTextures();
	PlayerTalentFramePreviewBar:StripTextures();

	S:HandleButton(PlayerTalentFrameResetButton);
	PlayerTalentFrameLearnButton:Point("RIGHT", PlayerTalentFrameResetButton, "LEFT", -1, 0);
	S:HandleButton(PlayerTalentFrameLearnButton);

	PlayerTalentFramePreviewBarFiller:StripTextures();

	PlayerTalentFrameScrollFrame:StripTextures();
	PlayerTalentFrameScrollFrame:CreateBackdrop("Default");
	S:HandleScrollBar(PlayerTalentFrameScrollFrameScrollBar);

	for i = 1, MAX_NUM_TALENTS do
		local talent = _G["PlayerTalentFrameTalent" .. i];
		local icon = _G["PlayerTalentFrameTalent" .. i .. "IconTexture"];

		talent:StripTextures();
		talent:StyleButton();
		talent:SetTemplate("Default");

		icon:SetInside();
		icon:SetTexCoord(unpack(E.TexCoords));
	end

	for i = 1, 4 do
		S:HandleTab(_G["PlayerTalentFrameTab" .. i]);
	end

	for i = 1, MAX_TALENT_TABS do
		local tab = _G["PlayerSpecTab" .. i];
		tab:GetRegions():Hide();

		tab:SetTemplate("Default");
		tab:StyleButton(nil, true);

		tab:GetNormalTexture():SetInside();
		tab:GetNormalTexture():SetTexCoord(unpack(E.TexCoords));
	end
end

S:RegisterSkin("Blizzard_TalentUI", LoadSkin);