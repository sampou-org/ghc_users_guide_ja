module Options.Cpp where

import Types

cppOptions :: [Flag]
cppOptions =
  [ flag { flagName = "-cpp"
         , flagDescription = "Haskell のソースファイルに対し C プリプロセッサを走らせる"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-D⟨symbol⟩[=⟨value⟩]"
         , flagDescription = "C プリプロセッサのシンボルを定義する"
         , flagType = DynamicFlag
         , flagReverse = "-U⟨symbol⟩"
         }
  , flag { flagName = "-U⟨symbol⟩"
         , flagDescription = "C プリプロセッサのシンボルを未定義にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-I⟨dir⟩"
         , flagDescription =
           "``#include`` ファイルの探索ディレクトリリストに⟨dir⟩を追加する"
         , flagType = DynamicFlag
         }
  ]
