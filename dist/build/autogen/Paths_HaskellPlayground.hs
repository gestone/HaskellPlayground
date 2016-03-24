module Paths_HaskellPlayground (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jharjanto/.cabal/bin"
libdir     = "/home/jharjanto/.cabal/lib/x86_64-linux-ghc-7.8.4/HaskellPlayground-0.1.0.0"
datadir    = "/home/jharjanto/.cabal/share/x86_64-linux-ghc-7.8.4/HaskellPlayground-0.1.0.0"
libexecdir = "/home/jharjanto/.cabal/libexec"
sysconfdir = "/home/jharjanto/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HaskellPlayground_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HaskellPlayground_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "HaskellPlayground_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HaskellPlayground_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HaskellPlayground_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
