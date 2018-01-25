module Options.RedirectingOutput where

import Types

redirectingOutputOptions :: [Flag]
redirectingOutputOptions =
  [ flag { flagName = "-hcsuf ⟨suffix⟩"
         , flagDescription = "中間 C ファイル用の接尾辞を設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-hidir ⟨dir⟩"
         , flagDescription = "インターフェイスファイルを置くディレクトリを設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-hisuf ⟨suffix⟩"
         , flagDescription = "インターフェイス用の接尾辞を設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-o ⟨file⟩"
         , flagDescription = "出力ファイル名を設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-odir ⟨dir⟩"
         , flagDescription = "オブジェクトファイルを置くディレクトリを設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ohi ⟨file⟩"
         , flagDescription = "インターフェイスを置くファイルの名前を設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-osuf ⟨suffix⟩"
         , flagDescription = "出力ファイルの接尾辞を設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-stubdir ⟨dir⟩"
         , flagDescription = "FFI のスタブファイルの出力先を変更"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dumpdir ⟨dir⟩"
         , flagDescription = "ダンプファイルの出力先を変更"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-outputdir ⟨dir⟩"
         , flagDescription = "出力ファイルを置くディレクトリを設定"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dyno ⟨file⟩"
         , flagDescription = "動的オブジェクト出力用ファイル名を設定 (``-dynamic-too`` 参照)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dynosuf ⟨suffix⟩"
         , flagDescription = "動的オブジェクトファイルの接尾辞を設定 (``-dynamic-too`` 参照)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dynhisuf ⟨suffix⟩"
         , flagDescription = "動的オブジェクト用インターフェイスファイル接尾辞を設定 (``-dynamic-too`` 参照)"
         , flagType = DynamicFlag
         }
  ]
