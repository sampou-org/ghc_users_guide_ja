module Options.CompilerDebugging where

import Types

compilerDebuggingOptions :: [Flag]
compilerDebuggingOptions =
  [ flag { flagName = "-dcore-lint"
         , flagDescription = "内部の正当性検査を有効にする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-to-file"
         , flagDescription = "標準出力ではなくファイルにダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-asm"
         , flagDescription = "アセンブリをダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-bcos"
         , flagDescription = "インタプリタバイトコードをダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-cmm-from-stg"
         , flagDescription = "STG-to-C-- の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-cmm-verbose"
         , flagDescription = "C-- のパイプラインパスごとの出力を表示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-cmm"
         , flagDescription = "C-- の最終的な出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-core-stats"
         , flagDescription =
           "最適化パイプラインの最後に Core プログラムの大きさの一行要約を表示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-cse"
         , flagDescription = "CSE の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-deriv"
         , flagDescription = "自動導出(deriving)の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-ds"
         , flagDescription = "デシュガー器の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-foreign"
         , flagDescription = "``foreign export`` スタブをダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-hpc"
         , flagDescription = "プログラム網羅率計器付与の後でダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-inlinings"
         , flagDescription = "インライン化情報をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-llvm"
         , flagDescription = "LLVM 中間コードをダンプする．  "++
           ":ghc-flag:`-fllvm` が有効になる"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-occur-anal"
         , flagDescription = "出現解析器の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-opt-cmm"
         , flagDescription = "C-- to C-- 最適化パスの結果をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-parsed"
         , flagDescription = "構文解析木をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-prep"
         , flagDescription = "prepare core をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-rn"
         , flagDescription = "名前変更器の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-rule-firings"
         , flagDescription = "規則の発動情報をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-rule-rewrites"
         , flagDescription = "規則の詳細な発動情報をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-rules"
         , flagDescription = "規則をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-vect"
         , flagDescription = "ベクトル化器の入力と出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-simpl"
         , flagDescription = "単純化器の最終出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-simpl-iterations"
         , flagDescription = "単純化器の各反復段階ごとの出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-spec"
         , flagDescription = "特定器の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-splices"
         , flagDescription =
           "TH でスプライスした式および評価結果をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-stg"
         , flagDescription = "最終段階の STG をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-stranal"
         , flagDescription = "正格性解析器の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-str-signatures"
         , flagDescription = "正格性シグネチャをダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-tc"
         , flagDescription = "型検査器の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dth-dec-file=⟨file⟩"
         , flagDescription =
           ".th.hs ファイルにある評価済み TH 宣言を表示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-types"
         , flagDescription = "型シグネチャをダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-worker-wrapper"
         , flagDescription = "worker-wrapper の出力をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-if-trace"
         , flagDescription = "インターフェイスファイルをトレースする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-tc-trace"
         , flagDescription = "型検査器をトレースする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-vt-trace"
         , flagDescription = "ベクトル化器をトレースする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-rn-trace"
         , flagDescription = "名前変更器をトレースする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-rn-stats"
         , flagDescription = "名前変更器の統計情報をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ddump-simpl-stats"
         , flagDescription = "単純化器の統計情報をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dno-debug-output"
         , flagDescription = "要求外のデバッグ出力を抑制する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dppr-debug"
         , flagDescription = "デバッグ表示を有効にする(かなり饒舌)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dppr-user-length"
         , flagDescription =
           "エラーメッセージで表示する式の深さを設定する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dppr-cols=⟨n⟩"
         , flagDescription =
           "デバッグ出力の幅を設定する． たとえば ``-dppr-cols200`` などとする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dppr-case-as-let"
         , flagDescription =
           "選択肢が1つの case 式を正格な let 束縛として表示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsuppress-all"
         , flagDescription =
           "コアダンプで抑制可能なもの (1つしか無いものをのぞいて)すべて抑制する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsuppress-uniques"
         , flagDescription =
           "デバッグ出力で1つしかないものの表示を抑制する(``diff`` を使いやすくするため)"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsuppress-idinfo"
         , flagDescription =
           "識別子の束縛位置について拡張情報を抑制する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsuppress-unfoldings"
         , flagDescription =
           "変数の束縛位置での安定展開を表示するのを抑制する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsuppress-module-prefixes"
         , flagDescription =
           "モジュール修飾接頭辞の表示を抑制する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsuppress-type-signatures"
         , flagDescription = "型シグネチャを抑制する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsuppress-type-applications"
         , flagDescription = "型適用を抑制する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsuppress-coercions"
         , flagDescription =
           "コアダンプの中で型変換を表示するのを抑制し " ++
           "コアダンプを短くする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dsource-stats"
         , flagDescription = "Haskell ソースの統計情報をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dcmm-lint"
         , flagDescription = "C-- パスの正当性検査"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dstg-lint"
         , flagDescription = "STG パスの正当性検査"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dstg-stats"
         , flagDescription = "STG の統計情報をダンプする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dverbose-core2core"
         , flagDescription = "core-to-core パスの各段階ごとに出力を表示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dverbose-stg2stg"
         , flagDescription = "STG-to-STG パスの各段階ごとに出力を表示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dshow-passes"
         , flagDescription = "各段階の名前を出現ごとに表示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-dfaststring-stats"
         , flagDescription =
           "fast string の利用終了時にその統計情報を表示する"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-frule-check"
         , flagDescription =
           "発動する可能性があったのに発動しなかったルールの場所を報告する． 文字列引数を1つとる"
         , flagType = DynamicFlag
         }
  ]
