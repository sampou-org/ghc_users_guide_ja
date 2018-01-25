module Options.Interactive where

import Types

interactiveOptions :: [Flag]
interactiveOptions =
  [ flag { flagName = "-ignore-dot-ghci"
         , flagDescription = "``.ghci`` を読み込み無効設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ghci-script"
         , flagDescription = "``.ghci`` ファイルの追加読み込み設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fbreak-on-error"
         , flagDescription =
           ":ref:`例外やエラーがキャッチできない場合にブレイク " ++
           "<ghci-debugger-exceptions>`"
         , flagType = DynamicFlag
         , flagReverse = "-fno-break-on-error"
         }
  , flag { flagName = "-fbreak-on-exception"
         , flagDescription =
           ":ref:`例外が投げられる場合にブレイク <ghci-debugger-exceptions>`"
         , flagType = DynamicFlag
         , flagReverse = "-fno-break-on-exception"
         }
  , flag { flagName = "-fghci-hist-size=⟨n⟩"
         , flagDescription =
           "GHCi が ``:history`` で保存する項目の数を設定． " ++
           ":ref:`ghci-debugger` 参照"
         , flagType = DynamicFlag
         , flagReverse = ""
         }
  , flag { flagName = "-fprint-evld-with-show"
         , flagDescription =
           "``:print`` で ``Show`` のインスタンス使用を有効に設定． " ++
           ":ref:`breakpoints` 参照"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-evld-with-show"
         }
  , flag { flagName = "-fprint-bind-result"
         , flagDescription =
           ":ref:`GHCi で束縛の結果表示を有効に設定 <ghci-stmts>`"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-bind-result"
         }
  , flag { flagName = "-fno-print-bind-contents"
         , flagDescription =
           ":ref:`GHCi で束縛の結果表示を無効に設定 <breakpoints>`"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-implicit-import-qualified"
         , flagDescription =
           ":ref:`GHCi ですべての暗黙修飾付きインポートを無効に設定 " ++
           "<ghci-import-qualified>`"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-interactive-print ⟨expr⟩"
         , flagDescription =
           ":ref:`GHCi において評価済みの式を表示するのに使う関数を選択 " ++
           "<ghci-interactive-print>`"
         , flagType = DynamicFlag
         }
  ]
