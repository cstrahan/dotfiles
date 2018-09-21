{-# LANGUAGE OverloadedStrings #-}

import System.Taffybar
import System.Taffybar.Information.Memory
import System.Taffybar.Information.CPU
import System.Taffybar.SimpleConfig
import System.Taffybar.Widget
import System.Taffybar.Widget.Generic.PollingBar
import System.Taffybar.Widget.Generic.PollingGraph

memCallback = do
  mi <- parseMeminfo
  return [memoryUsedRatio mi]

cpuCallback = do
  (userLoad, systemLoad, totalLoad) <- cpuLoad
  return [totalLoad, systemLoad]

main = do
  let memCfg = defaultGraphConfig { graphDataColors = [(1, 0, 0, 1)]
                                  , graphLabel = Just "mem"
                                  }
      cpuCfg = defaultGraphConfig { graphDataColors = [ (0, 1, 0, 1)
                                                      , (1, 0, 1, 0.5)
                                                      ]
                                  , graphLabel = Just "cpu"
                                  }
  let
      workspaces = workspacesNew defaultWorkspacesConfig
      mpris2 = mpris2New
      clock = textClockNew Nothing "<span fgcolor='orange'>%a %b %_d %H:%M</span>" 1
      batt = textBatteryNew "$percentage$%"
      mem = pollingGraphNew memCfg 1 memCallback
      cpu = pollingGraphNew cpuCfg 0.5 cpuCallback
      tray = sniTrayNew
      simpleConfig = defaultSimpleTaffyConfig
                       { startWidgets = [ workspaces, mpris2 ]
                       , endWidgets = [ clock, batt, mem, cpu, tray ]
                       , barHeight = 40
                       }

  simpleTaffybar simpleConfig
