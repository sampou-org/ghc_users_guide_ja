module Options.Verbosity where

import Types

verbosityOptions :: [Flag]
verbosityOptions =
  [ flag { flagName = "-v"
         , flagDescription = "饒舌モード (``-v 3`` と同じ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-v ⟨n⟩"
         , flagDescription = "饒舌性の設定"
         , flagType = DynamicFlag
         , flagReverse = ""
         }
  , flag { flagName = "-fhide-source-paths"
         , flagDescription = "モジュールのソースパスおよびオブジェクトパスの非表示"
         , flagType = DynamicFlag
         , flagReverse = ""
         }
  , flag { flagName = "-fprint-potential-instances"
         , flagDescription =
           "型エラーメッセージに判明しているすべてのインスタンスを表示"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-potential-instances"
         }
  , flag { flagName = "-fprint-explicit-foralls"
         , flagDescription =
           "型に ``forall`` 限量子を明示． " ++
           ":ghc-flag:`-XExplicitForAll` も参照"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-explicit-foralls"
         }
  , flag { flagName = "-fprint-explicit-kinds"
         , flagDescription =
           "型にカインド forall とカインド引数も明示． " ++
           ":ghc-flag:`-XKindSignatures` も参照"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-explicit-kinds"
         }
  , flag { flagName = "-fprint-explicit-runtime-reps"
         , flagDescription =
           "実行時表現多相型に含まれる " ++
           "``RuntimeRep`` 変数を明示"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-explicit-runtime-reps"
         }
  , flag { flagName = "-fprint-unicode-syntax"
         , flagDescription =
           "式，型，カインドを表示するときユニコード構文を使用． " ++
           ":ghc-flag:`-XUnicodeSyntax` も参照"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-unicode-syntax"
         }
  , flag { flagName = "-fprint-expanded-synonyms"
         , flagDescription =
           "型エラーに型シノニムを展開した型も表示"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-expanded-synonyms"
         }
  , flag { flagName = "-fprint-typechecker-elaboration"
         , flagDescription =
           "タイプ検査器が出す追加情報を表示"
         , flagType = DynamicFlag
         , flagReverse = "-fno-print-typechecker-elaboration"
         }
  , flag { flagName = "-fdiagnostics-color=(always|auto|never)"
         , flagDescription = "エラーメッセージで色を使用"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-f[no-]diagnostics-show-caret"
         , flagDescription = "元のソースコード位置を示すカレットを表示するか"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ferror-spans"
         , flagDescription = "完全なエラーメッセージを出力"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-Rghc-timing"
         , flagDescription =
           "GHC の実行時間統計をとる(``+RTS -tstderr`` と同じ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fshow-hole-constraints"
         , flagDescription = "型付きホールの報告時に制約を表示"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fshow-loaded-modules"
         , flagDescription = "GHCiが :ghci-cmd:`:load` コマンドでロード後モジュール名を表示"
         , flagType = DynamicFlag
         }
  ]
