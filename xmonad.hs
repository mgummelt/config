import System.IO

import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders
import XMonad.Hooks.UrgencyHook
import XMonad.Actions.CycleWS
import qualified XMonad.StackSet as W
import Graphics.X11.ExtraTypes

myWorkspaces = ["term", "web", "other"]

myLayoutHook = smartBorders . avoidStruts $ layoutHook defaultConfig

main = do
     xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
     xmonad $ defaultConfig
         { modMask = mod4Mask,
           layoutHook = myLayoutHook,
           manageHook = manageDocks,
           workspaces = myWorkspaces,
           borderWidth = 1,
           logHook = dynamicLogWithPP xmobarPP
             { ppOutput = hPutStrLn xmproc,
               ppTitle = xmobarColor "blue" "" . shorten 50,
               ppLayout = const ""
             }
         }
         `additionalKeysP`
         [ ("M-c", kill),
           ("M-<Right>", nextWS),
           ("M-<Left>", prevWS),
           ("M-S-<Left>", shiftToPrev),
           ("M-S-<Right>", shiftToNext),
           ("M-b", sendMessage ToggleStruts)
         ]
         `additionalKeys`
         [ ((0, xF86XK_AudioLowerVolume), spawn "amixer set Master 2-"),
           ((0, xF86XK_AudioRaiseVolume), spawn "amixer set Master 2+"),
           ((0, xF86XK_AudioMute), spawn "amixer set Master toggle")
         ]
