module Options.Misc where

import Types

miscOptions :: [Flag]
miscOptions =
  [ flag { flagName = "-j[⟨n⟩]"
         , flagDescription =
           ":ghc-flag:`--make` でコンパイルする時, ⟨n⟩ 個のモジュールを並列にコンパイルする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-hi-version-check"
         , flagDescription = "``.hi`` ファイルが合致しなくても文句は言わない"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fhistory-size"
         , flagDescription = "単純化の履歴をサイズを設定する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-ghci-history"
         , flagDescription =
           "GHCi のコマンド履歴を ``ghci_history`` に記録したり読み出したりしない"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-ghci-sandbox"
         , flagDescription =
           "GHCi のサンドボックスを無効にする． " ++
           "計算はフォークしたスレッドではなく主スレッドで動作する．"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-flocal-ghci-history"
         , flagDescription =
           "GHCi のコマンド履歴ファイル ``.ghci-history`` の置き場を現在のディレクトリにする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-local-ghci-history"
         }
  ]
