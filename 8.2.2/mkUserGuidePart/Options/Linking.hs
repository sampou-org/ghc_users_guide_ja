module Options.Linking where

import Types

linkingOptions :: [Flag]
linkingOptions =
  [ flag { flagName = "-shared"
         , flagDescription =
           "実行ファイルではなく共有ライブラリを生成する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fPIE"
         , flagDescription =
           "可能であれば位置独立実行コードを生成する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-pie"
         , flagDescription =
           "リンカに位置独立実行コードを生成するよう指示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dynload"
         , flagDescription =
           "実行時に共有ライブラリを探索する方法を1つ選択する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-framework ⟨name⟩"
         , flagDescription =
           "Darwin/OS X/iOS のみ． フレームワーク ⟨name⟩ をリンクする． " ++
           "このオプションは Apple のリンカ用の ``-framework`` オプションに対応する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-framework-path ⟨dir⟩"
         , flagDescription =
           "Darwin/OS X/iOS のみ． ⟨dir⟩ をフレームワーク検索ディレクトリリストに追加する " ++
           "このオプションは Apple のリンカ用の ``-F`` オプションに対応する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-l ⟨lib⟩"
         , flagDescription = "ライブラリ ⟨lib⟩ にリンクする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-L ⟨dir⟩"
         , flagDescription =
           "⟨dir⟩ をライブラリ検索ディレクトリリストに追加する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-main-is ⟨thing⟩"
         , flagDescription = "main モジュールと関数を設定する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "--mk-dll"
         , flagDescription = "DLL-生成モード (Windows のみ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-no-hs-main"
         , flagDescription = "このプログラムには ``main`` が含まれないものとする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-rtsopts[=⟨none|some|all⟩]"
         , flagDescription =
           "RTS の動作をコマンドラインフラグと ``GHCRTS`` 環境変数で調整できるかどうかを制御する． " ++
           "``none`` を使用すると RTS フラグは指定できない． " ++
           "``some`` なら最低限の安全なオプションのみ与えられる（デフォルト）． " ++
           "``all`` なら（または何も引数なし）すべての RTS フラグが許可される"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-with-rtsopts=⟨opts⟩"
         , flagDescription = "デフォルトの RTS オプションを ⟨opts⟩ に設定する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-no-rtsopts-suggestions"
         , flagDescription =
           ":ghc-flag:`-rtsopts[=⟨none|some|all⟩]` を使ってリンクする提案を表示しない"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-no-link"
         , flagDescription = "リンクを省略する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-split-objs"
         , flagDescription = "オブジェクトを分割する(ライブラリ用)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-split-sections"
         , flagDescription = "リンク時デッドコード除去用にセクションを分割する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-static"
         , flagDescription = "静的 Haskell ライブラリを使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-threaded"
         , flagDescription = "スレッド化されたランタイムを使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-debug"
         , flagDescription = "デバッグ用ランタイムを使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ticky"
         , flagDescription =
           "リンク用． 単に :ghc-flag:`-debug` を有効にする． " ++
           ":ref:`ticky-ticky` を参照"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-eventlog"
         , flagDescription = "ランタイムのイベントトレースを有効にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-gen-manifest"
         , flagDescription = "マニフェストファイルを生成しない(Windows のみ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-embed-manifest"
         , flagDescription =
           "実行ファイルにマニフェストファイルを埋め込まない(Windows のみ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fno-shared-implib"
         , flagDescription =
           "DLL 用のインポートライブラリを生成しない(Windows のみ)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dylib-install-name ⟨path⟩"
         , flagDescription =
           "ライブラリファイルのインストール先のフルパスを示す install name を設定する " ++
           "(これはAppleのリンカに ``-install_name`` を渡すことで行なう)． " ++
           "後にこのライブラリをリンクするライブラリや実行ファイルは " ++
           "このライブラリを実行時に探索する場所としてこのパスを選ぶ"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-rdynamic"
         , flagDescription =
           "このオプションはリンカに使用しているシンボルだけではなく " ++
           "すべてのシンボルを動的シンボルテーブルに追加するよう指示する． " ++
           "現在のところ Linux および Windows/MinGW32 のみ． " ++
           "このオプションは Linux 上では ``-optl -rdynamic`` を指定するのと同等． "
           "また Windows 上では ``-optl -export-all-symbols`` を指定するのと同等"
         , flagType = DynamicFlag
         }
  ]
