module Options.Plugin where

import Types

pluginOptions :: [Flag]
pluginOptions =
  [ flag { flagName = "-fplugin=⟨module⟩"
         , flagDescription = "指定されたモジュールからエクスポートされたプラグインをロードする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fplugin-opt=⟨module⟩:⟨args⟩"
         , flagDescription =
           "指定された引数を指定したプラグインモジュールに渡す． " ++
           "モジュールは ``-fplugin`` で指定されていなければならない"
         , flagType = DynamicFlag
         }
  ]
