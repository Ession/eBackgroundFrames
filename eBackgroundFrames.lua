-- =============================================================================
--
--       Filename:  eBackgroundFrames.lua
--
--    Description:  Creates frames as a ui background.
--
--        Version:  7.0.1
--
--         Author:  Mathias Jost (mail@mathiasjost.com)
--
-- =============================================================================




-- -----------------------------------------------------------------------------
-- Function for hiding the skada frames when not in a raid
-- -----------------------------------------------------------------------------
local function eBackgroundFrames_OnEvent(event, arg1)

  if GetNumSubgroupMembers() < 1 and GetNumGroupMembers() < 1 then
    ebfSkadaDamage:Hide()
    ebfSkadaThreat:Hide()
  else
    ebfSkadaDamage:Show()
    ebfSkadaThreat:Show()
  end

end


-- -----------------------------------------------------------------------------
-- Function for creating the bg frames
-- -----------------------------------------------------------------------------
local function FrameCreator(name, width, height, alpha, level)

  -- create the local frame
  local frame = CreateFrame("Frame", name, UIParent)

  frame:SetFrameStrata("BACKGROUND")
  frame:SetWidth(width)
  frame:SetHeight(height)
  frame:SetAlpha(alpha)

  frame:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\AddOns\\eBackgroundFrames\\HalBorder.tga",
    tile = false, tileSize = 0, edgeSize = 8,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
  })

  return frame

end


-- -----------------------------------------------------------------------------
-- Create the top Bar
-- -----------------------------------------------------------------------------

-- local ebfTopBar = FrameCreator("ebfTopBar", 2000, 30, 1.0, 0)
-- ebfTopBar:SetFrameStrata("BACKGROUND")
-- ebfTopBar:SetPoint("TOP", 0, 5)
-- ebfTopBar:Show()


-- -----------------------------------------------------------------------------
-- Create the Minimap Frame
-- -----------------------------------------------------------------------------
local ebfMinimap = FrameCreator("ebfMinimap", 150, 150, 1.0, 2)
ebfMinimap:SetPoint("TOPLEFT", 6, -6)
ebfMinimap:Show()


-- -----------------------------------------------------------------------------
-- Create the Minimap Panel 1 Frame
-- -----------------------------------------------------------------------------
local ebfMinimapP1 = FrameCreator("ebfMinimapP1", 75, 30, 1.0, 1)
ebfMinimapP1:SetPoint("TOPLEFT", 6, -156)
ebfMinimapP1:Show()


-- -----------------------------------------------------------------------------
-- Create the Minimap Panel 2 Frame
-- -----------------------------------------------------------------------------
local ebfMinimapP2 = FrameCreator("ebfMinimapP2", 75, 30, 1.0, 1)
ebfMinimapP2:SetPoint("TOPLEFT", 81, -156)
ebfMinimapP2:Show()


-- -----------------------------------------------------------------------------
-- Create the Minimap Panel 3 Frame
-- -----------------------------------------------------------------------------
local ebfMinimapP3 = FrameCreator("ebfMinimapP3", 150, 30, 1.0, 1)
ebfMinimapP3:SetPoint("TOPLEFT", 6, -186)
ebfMinimapP3:Show()


-- -----------------------------------------------------------------------------
-- Create the Skada Threat Frame
-- -----------------------------------------------------------------------------
local ebfSkadaThreat = FrameCreator("ebfSkadaThreat", 150, 185, 1.0, 1)
ebfSkadaThreat:SetPoint("TOPLEFT", 6, -216)
ebfSkadaThreat:Show()
ebfSkadaThreat:SetScript("OnEvent", eBackgroundFrames_OnEvent)
ebfSkadaThreat:RegisterEvent("PLAYER_ENTERING_WORLD")
ebfSkadaThreat:RegisterEvent("GROUP_ROSTER_UPDATE")


-- -----------------------------------------------------------------------------
-- Create the Skada Damage Frame
-- -----------------------------------------------------------------------------
local ebfSkadaDamage = FrameCreator("ebfSkadaDamage", 150, 185, 1.0, 1)
ebfSkadaDamage:SetPoint("TOPLEFT", 6, -401)
ebfSkadaDamage:Show()


-- -----------------------------------------------------------------------------
-- Create the bottom Bar
-- -----------------------------------------------------------------------------
-- local ebfBottomBar = FrameCreator("ebfBottomBar", 2000, 30, 1.0, 0)
-- ebfBottomBar:SetPoint("BOTTOM", 0, -5)
-- ebfBottomBar:Show()


-- -----------------------------------------------------------------------------
-- Create the Button Frame
-- -----------------------------------------------------------------------------
local ebfButtonFrame = FrameCreator("ebfButtonFrame", 455, 100, 1.0, 1)
ebfButtonFrame:SetPoint("BOTTOM", 0, 10)
ebfButtonFrame:Show()


-- -----------------------------------------------------------------------------
-- Redesign blizzard frames
-- -----------------------------------------------------------------------------
WorldStateAlwaysUpFrame:SetPoint("TOP", 0, -50)


--Boss1TargetFrame:ClearAllPoints()
--Boss1TargetFrame:SetPoint("TOPLEFT", "UIParent", "TOPRIGHT", 350,-300)
--Boss1TargetFrame.ClearAllPoints = function() end
--Boss1TargetFrame.SetPoint = function() end
--Boss1TargetFrame.SetAllPoints = function() end

