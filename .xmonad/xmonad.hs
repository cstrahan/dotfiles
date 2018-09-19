import Control.Monad
import Data.Maybe
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
    ++ [ (className =? "Pinentry" ) --> doCenterFloat ]
    ++ [ (className =? "Xmessage" <&&> appName =? "xmessage") --> doCenterFloat ]
    ++ [ (className =? "Blueman-manager") --> doCenterFloat ]
    {- ++ [ stringProperty "WM_WINDOW_ROLE" =? "pop-up" --> doCenterFloat ] -}
  where
    floaters = [ "xcalc", "wpa_gui" ]
    ignore   = [ "stalonetray" ]

-- e.g. pinentry uses the _NET_WM_STATE_ABOVE state, while not using a dialog
-- type ...
isAbove :: Query Bool
isAbove = isInProperty "_NET_WM_STATE" "_NET_WM_STATE_ABOVE"

-- Fix Java/AWT GUI apps. Otherwise: export _JAVA_AWT_WM_NONREPARENTING=1
fixAWT conf = conf { startupHook = startupHook conf <+> setWMName "LG3D" }

-- the sxiv app (and maybe others) believes that fullscreen is not supported,
-- so this fixes that.
-- see: https://mail.haskell.org/pipermail/xmonad/2017-March/015224.html
-- and: https://github.com/xmonad/xmonad-contrib/pull/109
addNETSupported :: Atom -> X ()
addNETSupported x   = withDisplay $ \dpy -> do
    r               <- asks theRoot
    a_NET_SUPPORTED <- getAtom "_NET_SUPPORTED"
    a               <- getAtom "ATOM"
    liftIO $ do
        sup <- (join . maybeToList) <$> getWindowProperty32 dpy a_NET_SUPPORTED r
        when (fromIntegral x `notElem` sup) $
          changeProperty32 dpy r a_NET_SUPPORTED a propModeAppend [fromIntegral x]

addEWMHFullscreen :: X ()
addEWMHFullscreen   = do
    wms <- getAtom "_NET_WM_STATE"
    wfs <- getAtom "_NET_WM_STATE_FULLSCREEN"
    mapM_ addNETSupported [wms, wfs]

main = do
    setEnv "_JAVA_AWT_WM_NONREPARENTING" "1"
    xmonad $ fixAWT $ docks $ ewmh $ pagerHints $ defaultConfig
        { modMask     = mod4Mask
        , terminal    = "termite"
        , borderWidth = 2
        , focusFollowsMouse  = True
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , handleEventHook    = handleEventHook defaultConfig <+> fullscreenEventHook
        , layoutHook  = smartBorders myLayout
        , manageHook  = myManageHook
        , startupHook = startupHook defaultConfig >> addEWMHFullscreen
        } `additionalKeys`
        [ ((mod4Mask, xK_z), spawn "xset s activate")
        ]
