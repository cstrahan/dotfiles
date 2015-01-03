import System.IO
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (fullscreenEventHook)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- Color of current window title in xmobar.
xmobarTitleColor = "#FFB6B0"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

tabConfig = defaultTheme
    { fontName = "xft:PragmataPro:pixelsize=16"
    , activeBorderColor = "#7C7C7C"
    , activeTextColor   = "#CEFFAC"
    , activeColor       = "#000000"
    , inactiveBorderColor = "#7C7C7C"
    , inactiveTextColor   = "#EEEEEE"
    , inactiveColor       = "#000000"
    }

myLayout = avoidStruts (
    Tall 1 (3/100) (1/2)          |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    tabbed shrinkText tabConfig   |||
    Full                          |||
    spiral (6/7)
    ) ||| noBorders (fullscreenFull Full)

myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "#ffb6b0"

myManageHook = composeAll $
       [ resource =? name --> doIgnore      | name <- ignore   ]
    ++ [ title    =? name --> doCenterFloat | name <- floaters ]
    ++ [ resource =? name --> doCenterFloat | name <- floaters ]
    ++ [ manageDocks <+> manageHook defaultConfig ]
    ++ [ (isFullscreen)  --> doFullFloat ]
    ++ [ (isDialog) --> doCenterFloat ]
    ++ [ (className =? "Xmessage" <&&> appName =? "xmessage") --> doCenterFloat ]
    ++ [ (className =? "Chromium" <&&> stringProperty "WM_WINDOW_ROLE" =? "pop-up") --> doCenterFloat ]
  where
    floaters = [ "xcalc", "wpa_gui" ]
    ignore   = [ "stalonetray" ]

main = do
    spawn "stalonetray"
    xmproc <- spawnPipe "xmobar"
    xmonad defaultConfig
        { modMask     = mod4Mask
        , terminal    = "urxvt"
        , borderWidth = 2
        , focusFollowsMouse = True
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , handleEventHook    = fullscreenEventHook
        , layoutHook = smartBorders myLayout
        , manageHook = myManageHook
        , logHook = dynamicLogWithPP $ xmobarPP
             { ppOutput  = hPutStrLn xmproc
             , ppTitle   = xmobarColor xmobarTitleColor "" . shorten 100
             , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
             , ppSep     = "   "
             }
        }

-- NOTES
--
--   WM_NAME:
--     title =? "Hangouts"
--   WM_CLASS:
--     appName =? "crx_nckgahadagoaajjgafhacjanaoiihapd"
--     className =? "Chromium"
--   WM_WINDOW_ROLE:
--     stringProperty "WM_WINDOW_ROLE" =? "pop-up"
