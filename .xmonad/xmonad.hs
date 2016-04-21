import System.IO
import System.Environment (setEnv)
import System.Exit
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook, ewmhDesktopsStartup,
                                 ewmhDesktopsEventHook, ewmhDesktopsLogHook)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import System.Taffybar.Hooks.PagerHints (pagerHints)

-- TODO: `loginctl lock-session` vs `xset s activate`?

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
    Full
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
    ++ [ (className =? "Blueman-manager") --> doCenterFloat ]
    ++ [ stringProperty "WM_WINDOW_ROLE" =? "pop-up" --> doCenterFloat ]
  where
    floaters = [ "xcalc", "wpa_gui" ]
    ignore   = [ "stalonetray" ]

-- Fix Java/AWT GUI apps. Otherwise: export _JAVA_AWT_WM_NONREPARENTING=1
fixAWT conf = conf { startupHook = startupHook conf <+> setWMName "LG3D" }

main = do
    setEnv "_JAVA_AWT_WM_NONREPARENTING" "1"
    xmonad $ fixAWT $ ewmh $ pagerHints $ defaultConfig
        { modMask     = mod4Mask
        , terminal    = "termite"
        , borderWidth = 2
        , focusFollowsMouse  = True
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , handleEventHook    = handleEventHook defaultConfig <+> fullscreenEventHook
        , layoutHook  = smartBorders myLayout
        , manageHook  = myManageHook
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
