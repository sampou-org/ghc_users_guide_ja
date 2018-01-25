module Options.InterfaceFiles where

import Types

interfaceFilesOptions :: [Flag]
interfaceFilesOptions =
  [ flag { flagName = "-ddump-hi"
         , flagDescription = "新しいインターフェイスファイルを標準出力に出力"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-hi-diffs"
         , flagDescription = "古いインターフェイスファイルと比較しての差分を表示"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-minimal-imports"
         , flagDescription = "最小のインポートを出力"
         , flagType = DynamicFlag
         }
  , flag { flagName = "--show-iface ⟨file⟩"
         , flagDescription = ":ref:`modes` 参照"
         , flagType = ModeFlag
         }
  ]
