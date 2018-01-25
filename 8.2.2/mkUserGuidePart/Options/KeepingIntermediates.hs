module Options.KeepingIntermediates where

import Types

keepingIntermediatesOptions :: [Flag]
keepingIntermediatesOptions =
  [ flag { flagName = "-keep-hc-file, -keep-hc-files"
         , flagDescription = "中間の ``.hc`` ファイルを保持"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-keep-hi-files"
         , flagDescription =
           "中間の ``.hi`` ファイルを保持 (デフォルト)"
         , flagType = DynamicFlag
         , flagReverse = "-no-keep-hi-files"
         }
  , flag { flagName = "-keep-llvm-file, -keep-llvm-files"
         , flagDescription = "中間の LLVM ``.ll`` ファイルを保持． " ++
           ":ghc-flag:`-fllvm` によって有効になる"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-keep-o-files"
         , flagDescription =
           "中間の ``.o`` ファイルを保持 (デフォルト)"
         , flagType = DynamicFlag
         , flagReverse = "-no-keep-o-files"
         }
  , flag { flagName = "-keep-s-file, -keep-s-files"
         , flagDescription = "中間の ``.s`` ファイルを保持"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-keep-tmp-files"
         , flagDescription = "すべての中間ファイルを保持"
         , flagType = DynamicFlag
         }
  ]
