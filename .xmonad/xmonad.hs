import XMonad
 
main = xmonad defaultConfig
              { modMask = mod4Mask  -- super instead of alt (usually Windows key)
              , terminal = "urxvt"
              }
