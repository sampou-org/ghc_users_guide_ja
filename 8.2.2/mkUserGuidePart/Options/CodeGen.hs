module Options.CodeGen where

import Types

codegenOptions :: [Flag]
codegenOptions =
  [ flag { flagName = "-fasm"
         , flagDescription =
           ":ref:`ネイティブコード生成器 <native-code-gen>` を使う"
         , flagType = DynamicFlag
         , flagReverse = "-fllvm"
         }
  , flag { flagName = "-fllvm"
         , flagDescription =
           ":ref:`LLVM コード生成器 <llvm-code-gen>` を使ってコンパイルする"
         , flagType = DynamicFlag
         , flagReverse = "-fasm"
         }
  , flag { flagName = "-fno-code"
         , flagDescription = "コード生成を省略する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fwrite-interface"
         , flagDescription = "つねにインターフェイスファイルを書くようにする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fbyte-code"
         , flagDescription = "バイトコードを生成する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fobject-code"
         , flagDescription = "オブジェクトコードを生成する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-g⟨n⟩"
         , flagDescription =
           "オブジェクトファイルに DWARF デバッグ情報を含める． " ++
           "⟨n⟩ は 0, 1, または 2 で大きいほど出力に含まれる情報が多くなる． " ++
           "⟨n⟩ を省略するとレベル 2 が指定されたものとする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dynamic"
         , flagDescription = "動的リンクされるオブジェクトファイルと 実行可能ファイルをビルドする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dynamic-too"
         , flagDescription =
           "コンパイル中に 静的オブジェクトファイルに *加えて* 動的オブジェクトファイルも生成する"
         , flagType = DynamicFlag
         }
  ]
