import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Layout.Gaps
{-isFullscreen-}
import XMonad.Hooks.ManageHelpers
{-Docks-}
import XMonad.Hooks.ManageDocks
import qualified Data.Map as M
import XMonad.Hooks.Minimize
import XMonad.Layout.Minimize
{-layout-}
import XMonad.Layout
import XMonad hiding ( (|||) )

import XMonad.Layout.BorderResize
import XMonad.Layout.BoringWindows
import XMonad.Layout.ButtonDecoration
import XMonad.Layout.Decoration
import XMonad.Layout.DecorationAddons
import XMonad.Layout.DraggingVisualizer
{-import XMonad.Layout.LayoutCombinators-}
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.Named
import XMonad.Layout.NoBorders
import XMonad.Layout.PositionStoreFloat
import XMonad.Layout.WindowSwitcherDecoration

import XMonad.Actions.CycleWS
import XMonad.Actions.PhysicalScreens
import XMonad.Actions.WindowMenu

import XMonad.Hooks.CurrentWorkspaceOnTop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.Minimize
import XMonad.Hooks.PositionStoreHooks
import XMonad.Hooks.ServerMode
import XMonad.Hooks.WorkspaceByPos

import XMonad.Config.Gnome

import qualified XMonad.StackSet as W
import qualified Data.Map as M

import System.Exit
import Data.Monoid
import Control.Monad(when)



myManageHook = composeAll (
    [ manageHook gnomeConfig
    , positionStoreManageHook (Just defaultThemeWithButtons)
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat
    , isFullscreen --> doFullFloat
    , manageDocks
    ])

main = xmonad gnomeConfig {
  manageHook = myManageHook
  , modMask = mod4Mask
  , layoutHook = avoidStruts $ minimize $ layout
  , keys = myKeys
  , handleEventHook = ewmhDesktopsEventHook
    `mappend` minimizeEventHook
  }

layout = tiled ||| Mirror tiled ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myKeys x= M.union (M.fromList (newKeys x)) (keys defaultConfig x)


newKeys conf@(XConfig {XMonad.modMask = modm}) = [
      ((mod4Mask .|. shiftMask, xK_m), sendMessage RestoreNextMinimizedWin)
      , ((mod4Mask, xK_m), withFocused minimizeWindow)
      ]
