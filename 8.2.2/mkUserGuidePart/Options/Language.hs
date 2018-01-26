module Options.Language where

import Types

languageOptions :: [Flag]
languageOptions =
  [ flag { flagName = "-fconstraint-solver-iterations=⟨n⟩"
         , flagDescription =
           "*デフォルト: 4．* 型制約ソルバーの反復限界を設定． " ++
           "通常は1回で十分なので， デフォルト値よりも大きい必要があるときは " ++
           "大声で報せてください． " ++
           "0 で限界値解除"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-freduction-depth=⟨n⟩"
         , flagDescription =
           "*デフォルト 200．* :ref:`型単純化の上限値を設定． "++
           "<undecidable-instances>`  0 で限界値解除"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fcontext-stack=⟨n⟩"
         , flagDescription =
           "非推奨． 代りに ``-freduction-depth=⟨n⟩`` を使用すること"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-fglasgow-exts"
         , flagDescription =
           "非推奨． ほとんどの言語拡張を有効にする． " ++
           "どの言語拡張が有効になるかは :ref:`options-language` を参照のこと"
         , flagType = DynamicFlag
         , flagReverse = "-fno-glasgow-exts"
         }
  , flag { flagName = "-firrefutable-tuples"
         , flagDescription = "タプルパターン照合を反駁不可にする"
         , flagType = DynamicFlag
         , flagReverse = "-fno-irrefutable-tuples"
         }
  , flag { flagName = "-fpackage-trust"
         , flagDescription =
           ":ref:`Safe Haskell <safe-haskell>` の trusted パッケージが "++
           "信頼できるモジュールを要求するようにする"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-ftype-function-depth=⟨n⟩"
         , flagDescription = "非推奨． 代りに ``-freduction-depth=⟨n⟩`` を使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-XAllowAmbiguousTypes"
         , flagDescription =
           "ユーザーが :ref:`曖昧な型 <ambiguity>` を書けるようにし， " ++
           "型推論エンジンはそれを推論するようにする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoAllowAmbiguousTypes"
         , flagSince = "7.8.1"
         }
  , flag { flagName = "-XArrows"
         , flagDescription =
           ":ref:`アロー記法 <arrow-notation>` 拡張を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoArrows"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XApplicativeDo"
         , flagDescription =
           ":ref:`Applicative do-記法のデシュガー <applicative-do>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoApplicativeDo"
         , flagSince = "8.0.1"
         }
  , flag { flagName = "-XAutoDeriveTypeable"
         , flagDescription =
           "GHC 7.10 以降このオプションは不要なので使うべきではない． " ++
           "以前はこれによりすべてのデータ型宣言，型クラス宣言に対して " ++
           ":ref:`Typeable のインスタンスが自動的に設定された． <deriving-typeable>` " ++
           "このオプションは :ghc-flag:`-XDeriveDataTypeable` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoAutoDeriveTypeable"
         , flagSince = "7.8.1"
         }
  , flag { flagName = "-XBangPatterns"
         , flagDescription = ":ref:`バンパターン <bang-patterns>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoBangPatterns"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XBinaryLiterals"
         , flagDescription =
           ":ref:`バイナリリテラル <binary-literals>` のサポートを有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoBinaryLiterals"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XCApiFFI"
         , flagDescription =
           ":ref:`CAPI の呼び出し規則 <ffi-capi>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoCAPIFFI"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XConstrainedClassMethods"
         , flagDescription =
           ":ref:`制約付きクラスメソッド <class-method-types>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoConstrainedClassMethods"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XConstraintKinds"
         , flagDescription =
           ":ref:`制約のカインド <constraint-kind>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoConstraintKinds"
         , flagSince = "7.4.1"
         }
  , flag { flagName = "-XCPP"
         , flagDescription =
           ":ref:`C のプリプロセッサ <c-pre-processor>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoCPP"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XDataKinds"
         , flagDescription = ":ref:`データ型の昇格 <promotion>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDataKinds"
         , flagSince = "7.4.1"
         }
  , flag { flagName = "-XDefaultSignatures"
         , flagDescription =
           ":ref:`デフォルトシグネチャ <class-default-signatures>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDefaultSignatures"
         , flagSince = "7.2.1"
         }
  , flag { flagName = "-XDeriveAnyClass"
         , flagDescription =
           ":ref:`任意のクラスの導出 <derive-any-class>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDeriveAnyClass"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XDeriveDataTypeable"
         , flagDescription =
           ":ref:`Data クラスの導出 <deriving-typeable>` を有効にする． " ++
           ":ghc-flag:`-XAutoDeriveTypeable` を指定すると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDeriveDataTypeable"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XDeriveFunctor"
         , flagDescription =
           ":ref:`Functor クラスの導出 <deriving-extra>` を有効にする． " ++
           ":ghc-flag:`-XDeriveTraversable` を指定すると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDeriveFunctor"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XDeriveFoldable"
         , flagDescription =
           ":ref:`Foldable クラスの導出 <deriving-extra>` を有効にする． " ++
           ":ghc-flag:`-XDeriveTraversable` を指定すると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDeriveFoldable"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XDeriveGeneric"
         , flagDescription =
           ":ref:`Generic クラスの導出 <deriving-typeable>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDeriveGeneric"
         , flagSince = "7.2.1"
         }
  -- , flag { flagName = "-XDeriveGeneric"
  --        , flagDescription =
  --          ":ref:`deriving for the Generic class <deriving-typeable>`."
  --        , flagType = DynamicFlag
  --        , flagReverse = "-XNoDeriveGeneric"
  --        , flagSince = "7.2.1"
  --        }
  , flag { flagName = "-XDeriveLift"
         , flagDescription =
           ":ref:`Lift クラスの導出 <deriving-lift>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDeriveLift"
         , flagSince = "7.2.1"
         }
  , flag { flagName = "-XDeriveTraversable"
         , flagDescription =
           ":ref:`Traversable クラスの導出 <deriving-extra>` を有効にする． "++
           "これを有効にすると :ghc-flag:`-XDeriveFunctor` および :ghc-flag:`-XDeriveFoldable` も有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDeriveTraversable"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XDerivingStrategies"
         , flagDescription =
           ":ref:`導出戦略 <deriving-strategies>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDerivingStrategies"
         , flagSince = "8.2.1"
         }
  , flag { flagName = "-XDisambiguateRecordFields"
         , flagDescription =
           ":ref:`レコードフィールドの曖昧性除去 <disambiguate-fields>` を有効にする． "++
           ":ghc-flag:`-XRecordWildCards` を指定すると有効になる．"
         , flagType = DynamicFlag
         , flagReverse = "-XNoDisambiguateRecordFields"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XEmptyCase"
         , flagDescription =
           ":ref:`選択肢のない case <empty-case>` を許可する"
         , flagType = DynamicFlag
         , flagReverse = "-XNoEmptyCase"
         , flagSince = "7.8.1"
         }
  , flag { flagName = "-XEmptyDataDecls"
         , flagDescription = "空のデータ型宣言を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoEmptyDataDecls"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XExistentialQuantification"
         , flagDescription =
           ":ref:`存在量化 <existential-quantification>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoExistentialQuantification"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XExplicitForAll"
         , flagDescription =
           ":ref:`全称量化の明示 <explicit-foralls>` を有効にする． " ++
           " :ghc-flag:`-XScopedTypeVariables`, :ghc-flag:`-XLiberalTypeSynonyms`,"++
           " :ghc-flag:`-XRankNTypes`, :ghc-flag:`-XExistentialQuantification` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoExplicitForAll"
         , flagSince = "6.12.1"
         }
  , flag { flagName = "-XExplicitNamespaces"
         , flagDescription =
           "キーワード ``type`` を使って インポートリストとエクスポートリストにある " ++
           "実体の名前空間を指定する (:ref:`explicit-namespaces`) ことを有効にする． " ++
           ":ghc-flag:`-XTypeOperators` および :ghc-flag:`-XTypeFamilies` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoExplicitNamespaces"
         , flagSince = "7.6.1"
         }
  , flag { flagName = "-XExtendedDefaultRules"
         , flagDescription =
           "GHCi の :ref:`拡張デフォルト規則 <extended-default-rules>` を "++
           "通常のモジュールで使う"
         , flagType = DynamicFlag
         , flagReverse = "-XNoExtendedDefaultRules"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XFlexibleContexts"
         , flagDescription =
           ":ref:`柔軟なコンテキスト <flexible-contexts>` を有効にする． " ++
           ":ghc-flag:`-XImplicitParams` を指定すると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoFlexibleContexts"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XFlexibleInstances"
         , flagDescription =
           ":ref:`柔軟なインスタンス <instance-rules>` を有効にする． " ++
           "これを有効にすると :ghc-flag:`-XTypeSynonymInstances` が有効になる． "++
           "これは :ghc-flag:`-XImplicitParams` を指定すると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoFlexibleInstances"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XForeignFunctionInterface"
         , flagDescription =
           ":ref:`外部関数インターフェイス <ffi>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoForeignFunctionInterface"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XFunctionalDependencies"
         , flagDescription =
           ":ref:`関数従属 <functional-dependencies>` を有効にする． " ++
           "これを有効にすると :ghc-flag:`-XMultiParamTypeClasses` が有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoFunctionalDependencies"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XGADTs"
         , flagDescription =
           ":ref:`一般化代数データ型 <gadt>` を有効にする． " ++
           "これを有効にすると :ghc-flag:`-XGADTSyntax` および :ghc-flag:`-XMonoLocalBinds` が有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoGADTs"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XGADTSyntax"
         , flagDescription =
           ":ref:`一般化代数データ型構文 <gadt-style>` を有効にする． "
         , flagType = DynamicFlag
         , flagReverse = "-XNoGADTSyntax"
         , flagSince = "7.2.1"
         }
  , flag { flagName = "-XGeneralizedNewtypeDeriving"
         , flagDescription =
           ":ref:`newtype deriving <newtype-deriving>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoGeneralizedNewtypeDeriving"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XGenerics"
         , flagDescription =
           "非推奨．何の効果もなく :ref:`総称クラス <generic-classes>` を有効にすることもない．" ++
           "GHC の :ref:`総称プログラミング <generic-programming>` のサポートも参照のこと"
         , flagType = DynamicFlag
         , flagReverse = "-XNoGenerics"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XImplicitParams"
         , flagDescription =
           ":ref:`暗黙パラメータ <implicit-parameters>` を有効にする " ++
           "これを有効にすると :ghc-flag:`-XFlexibleContexts` および :ghc-flag:`-XFlexibleInstances` が有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoImplicitParams"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XNoImplicitPrelude"
         , flagDescription =
           "暗黙に ``import Prelude`` しない． " ++
           "これは :ghc-flag:`-XRebindableSyntax` を指定すると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XImplicitPrelude"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XImpredicativeTypes"
         , flagDescription =
           ":ref:`非可述型 <impredicative-polymorphism>` を有効にする． "++
           "これを有効すると :ghc-flag:`-XRankNTypes` が有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoImpredicativeTypes"
         , flagSince = "6.10.1"
         }
  , flag { flagName = "-XIncoherentInstances"
         , flagDescription =
           ":ref:`非整合インスタンス <instance-overlap>` を有効にする． "++
           "これを有効にすると :ghc-flag:`-XOverlappingInstances` が有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoIncoherentInstances"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XTypeFamilyDependencies"
         , flagDescription =
           ":ref:`単射的型族 <injective-ty-fams>` を有効にする "++
           "Implies :ghc-flag:`-XTypeFamilies`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTypeFamilyDependencies"
         , flagSince = "8.0.1"
         }
  , flag { flagName = "-XInstanceSigs"
         , flagDescription =
           ":ref:`インスタンスシグネチャ <instance-sigs>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoInstanceSigs"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XInterruptibleFFI"
         , flagDescription = "割り込み可能な FFI を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoInterruptibleFFI"
         , flagSince = "7.2.1"
         }
  , flag { flagName = "-XKindSignatures"
         , flagDescription =
           ":ref:`カインドシグネチャ <kinding>` を有効にする． " ++
           "これは :ghc-flag:`-XTypeFamilies` および :ghc-flag:`-XPolyKinds` を指定すれば有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoKindSignatures"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XLambdaCase"
         , flagDescription =
           ":ref:`lambda-case 式 <lambda-case>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoLambdaCase"
         , flagSince = "7.6.1"
         }
  , flag { flagName = "-XLiberalTypeSynonyms"
         , flagDescription =
           "Enable :ref:`自由化型シノニム <type-synonyms>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoLiberalTypeSynonyms"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XMagicHash"
         , flagDescription =
           "``#`` を :ref:`識別子の接頭辞として付ける <magic-hash>` ことを有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoMagicHash"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XMonadComprehensions"
         , flagDescription =
           ":ref:`モナド内包表記 `<monad-comprehensions>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoMonadComprehensions"
         , flagSince = "7.2.1"
         }
  , flag { flagName = "-XMonoLocalBinds"
         , flagDescription =
           ":ref:`局所的な束縛の一般化 <mono-local-binds>` をしない設定を有効にする． " ++
           "これは :ghc-flag:`-XTypeFamilies` および :ghc-flag:`-XGADTs` を有効にすると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoMonoLocalBinds"
         , flagSince = "6.12.1"
         }
  , flag { flagName = "-XNoMonomorphismRestriction"
         , flagDescription =
           ":ref:`単相性制限 <monomorphism>` を無効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XMonomorphismRestriction"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XMultiParamTypeClasses"
         , flagDescription =
           ":ref:`多パラメータ型クラス <multi-param-type-classes>` を有効にする． " ++
           "これは :ghc-flag:`-XFunctionalDependencies` を指定すれば有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoMultiParamTypeClasses"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XMultiWayIf"
         , flagDescription =
           ":ref:`多分岐 if-式 <multi-way-if>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoMultiWayIf"
         , flagSince = "7.6.1"
         }
  , flag { flagName = "-XNamedFieldPuns"
         , flagDescription = ":ref:`レコード同名利用 <record-puns>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoNamedFieldPuns"
         , flagSince = "6.10.1"
         }
  , flag { flagName = "-XNamedWildCards"
         , flagDescription = ":ref:`名前付きワイルドカード <named-wildcards>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoNamedWildCards"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XNegativeLiterals"
         , flagDescription =
           ":ref:`負数リテラル <negative-literals>` のサポートを有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoNegativeLiterals"
         , flagSince = "7.8.1"
         }
  , flag { flagName = "-XNPlusKPatterns"
         , flagDescription = "``n+k`` パターンのサポートを有効にする． "++
           "これは :ghc-flag:`-XHaskell98` を指定すると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoNPlusKPatterns"
         , flagSince = "6.12.1"
         }
  , flag { flagName = "-XNullaryTypeClasses"
         , flagDescription =
           "非推奨． 何の効果もない． " ++
           ":ref:`無引数型クラス <nullary-type-classes>` は " ++
           ":ghc-flag:`-XMultiParamTypeClasses` で有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoNullaryTypeClasses"
         , flagSince = "7.8.1"
         }
  , flag { flagName = "-XNumDecimals"
         , flagDescription =
           "「小数表記」の整数リテラルのサポートを有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoNumDecimals"
         , flagSince = "7.8.1"
         }
  , flag { flagName = "-XOverlappingInstances"
         , flagDescription =
           ":ref:`インスタンスのオーバーラップ <instance-overlap>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoOverlappingInstances"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XOverloadedLabels"
         , flagDescription =
           ":ref:`ラベルの多重定義 <overloaded-labels>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoOverloadedLabels"
         , flagSince = "8.0.1"
         }
  , flag { flagName = "-XOverloadedLists"
         , flagDescription =
           ":ref:`リストの多重定義 <overloaded-lists>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoOverloadedLists"
         , flagSince = "7.8.1"
         }
  , flag { flagName = "-XOverloadedStrings"
         , flagDescription =
           ":ref:`文字列リテラルの多重定義 <overloaded-strings>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoOverloadedStrings"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XPackageImports"
         , flagDescription =
           ":ref:`パッケージ修飾されたインポート <package-imports>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoPackageImports"
         , flagSince = "6.10.1"
         }
  , flag { flagName = "-XParallelArrays"
         , flagDescription =
           "並列配列を有効にする． これを有効にすると :ghc-flag:`-XParallelListComp` が有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoParallelArrays"
         , flagSince = "7.4.1"
         }
  , flag { flagName = "-XParallelListComp"
         , flagDescription =
           ":ref:`並列リスト内包表記 <parallel-list-comprehensions>` を有効にする " ++
           "これは :ghc-flag:`-XParallelArrays` を設定すると有効になる"
         , flagType = DynamicFlag
         , flagReverse = "-XNoParallelListComp"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XPartialTypeSignatures"
         , flagDescription =
           ":ref:`部分型シグネチャ <partial-type-signatures>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoPartialTypeSignatures"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XNoPatternGuards"
         , flagDescription = ":ref:`パターンガード <pattern-guards>` を無効にする． " ++
           "これは :ghc-flag:`-XHaskell98` を有効にすると設定される"
         , flagType = DynamicFlag
         , flagReverse = "-XPatternGuards"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XPatternSynonyms"
         , flagDescription =
           ":ref:`パターンシノニム <pattern-synonyms>` を有効にする"
         , flagType = DynamicFlag
         , flagReverse = "-XNoPatternSynonyms"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XPolyKinds"
         , flagDescription =
           ":ref:`カインド多相 <kind-polymorphism>` を有効にする． " ++
           "これを有効にすると :ghc-flag:`-XKindSignatures` が設定される"
         , flagType = DynamicFlag
         , flagReverse = "-XNoPolyKinds"
         , flagSince = "7.4.1"
         }
  , flag { flagName = "-XPolymorphicComponents"
         , flagDescription =
           "Enable :ref:`polymorphic components for data constructors "++
           "<universal-quantification>`. Synonym for :ghc-flag:`-XRankNTypes`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoPolymorphicComponents"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XPostfixOperators"
         , flagDescription =
           "Enable :ref:`postfix operators <postfix-operators>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoPostfixOperators"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XQuasiQuotes"
         , flagDescription = "Enable :ref:`quasiquotation <th-quasiquotation>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoQuasiQuotes"
         , flagSince = "6.10.1"
         }
  , flag { flagName = "-XRank2Types"
         , flagDescription =
           "Enable :ref:`rank-2 types <universal-quantification>`. "++
           "Synonym for :ghc-flag:`-XRankNTypes`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoRank2Types"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XRankNTypes"
         , flagDescription =
           "Enable :ref:`rank-N types <universal-quantification>`. "++
           "Implied by :ghc-flag:`-XImpredicativeTypes`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoRankNTypes"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XRebindableSyntax"
         , flagDescription =
           "Employ :ref:`rebindable syntax <rebindable-syntax>`. "++
           "Implies :ghc-flag:`-XNoImplicitPrelude`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoRebindableSyntax"
         , flagSince = "7.0.1"
         }
  , flag { flagName = "-XRecordWildCards"
         , flagDescription =
           "Enable :ref:`record wildcards <record-wildcards>`. "++
           "Implies :ghc-flag:`-XDisambiguateRecordFields`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoRecordWildCards"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XRecursiveDo"
         , flagDescription =
           "Enable :ref:`recursive do (mdo) notation <recursive-do-notation>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoRecursiveDo"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XRoleAnnotations"
         , flagDescription =
           "Enable :ref:`role annotations <role-annotations>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoRoleAnnotations"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XSafe"
         , flagDescription =
           "Enable the :ref:`Safe Haskell <safe-haskell>` Safe mode."
         , flagType = DynamicFlag
         , flagSince = "7.2.1"
         }
  , flag { flagName = "-XScopedTypeVariables"
         , flagDescription =
           "Enable :ref:`lexically-scoped type variables "++
           "<scoped-type-variables>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoScopedTypeVariables"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XStandaloneDeriving"
         , flagDescription =
           "Enable :ref:`standalone deriving <stand-alone-deriving>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoStandaloneDeriving"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XStaticPointers"
         , flagDescription =
           "Enable :ref:`static pointers <static-pointers>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoStaticPointers"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XStrictData"
         , flagDescription =
           "Enable :ref:`default strict datatype fields <strict-data>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoStrictData"
         }
  , flag { flagName = "-XTemplateHaskell"
         , flagDescription =
           "Enable :ref:`Template Haskell <template-haskell>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTemplateHaskell"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XTemplateHaskellQuotes"
         , flagDescription = "Enable quotation subset of "++
                             ":ref:`Template Haskell <template-haskell>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTemplateHaskellQuotes"
         , flagSince = "8.0.1"
         }
  , flag { flagName = "-XNoTraditionalRecordSyntax"
         , flagDescription =
           "Disable support for traditional record syntax "++
           "(as supported by Haskell 98) ``C {f = x}``"
         , flagType = DynamicFlag
         , flagReverse = "-XTraditionalRecordSyntax"
         , flagSince = "7.4.1"
         }
  , flag { flagName = "-XTransformListComp"
         , flagDescription =
           "Enable :ref:`generalised list comprehensions "++
           "<generalised-list-comprehensions>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTransformListComp"
         , flagSince = "6.10.1"
         }
  , flag { flagName = "-XTrustworthy"
         , flagDescription =
           "Enable the :ref:`Safe Haskell <safe-haskell>` Trustworthy mode."
         , flagType = DynamicFlag
         , flagSince = "7.2.1"
         }
  , flag { flagName = "-XTupleSections"
         , flagDescription = "Enable :ref:`tuple sections <tuple-sections>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTupleSections"
         , flagSince = "7.10.1"
         }
  , flag { flagName = "-XTypeFamilies"
         , flagDescription =
           "Enable :ref:`type families <type-families>`. "++
           "Implies :ghc-flag:`-XExplicitNamespaces`, :ghc-flag:`-XKindSignatures`, "++
           "and :ghc-flag:`-XMonoLocalBinds`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTypeFamilies"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XTypeInType"
         , flagDescription =
           "Allow :ref:`kinds to be used as types <type-in-type>`, " ++
           "including explicit kind variable quantification, higher-rank "++
           "kinds, kind synonyms, and kind families. "++
           "Implies :ghc-flag:`-XDataKinds`, :ghc-flag:`-XKindSignatures`, " ++
           "and :ghc-flag:`-XPolyKinds`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTypeInType"
         , flagSince = "8.0.1"
         }
  , flag { flagName = "-XTypeOperators"
         , flagDescription =
           "Enable :ref:`type operators <type-operators>`. "++
           "Implies :ghc-flag:`-XExplicitNamespaces`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTypeOperators"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XTypeSynonymInstances"
         , flagDescription =
           "Enable :ref:`type synonyms in instance heads "++
           "<flexible-instance-head>`. Implied by :ghc-flag:`-XFlexibleInstances`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoTypeSynonymInstances"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XUnboxedTuples"
         , flagDescription = "Enable :ref:`unboxed tuples <unboxed-tuples>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoUnboxedTuples"
         , flagSince = "6.8.1"
         }
  , flag { flagName ="-XUnboxedSums"
         , flagDescription = "Enable :ref: `unboxed sums <unboxed-sums>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoUnboxedSums"
         , flagSince = "8.2.1"
         }
  , flag { flagName = "-XUndecidableInstances"
         , flagDescription =
           "Enable :ref:`undecidable instances <undecidable-instances>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoUndecidableInstances"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XUnicodeSyntax"
         , flagDescription = "Enable :ref:`unicode syntax <unicode-syntax>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoUnicodeSyntax"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XUnliftedFFITypes"
         , flagDescription = "Enable unlifted FFI types."
         , flagType = DynamicFlag
         , flagReverse = "-XNoUnliftedFFITypes"
         , flagSince = "6.8.1"
         }
  , flag { flagName = "-XUnsafe"
         , flagDescription =
           "Enable :ref:`Safe Haskell <safe-haskell>` Unsafe mode."
         , flagType = DynamicFlag
         , flagSince = "7.4.1"
         }
  , flag { flagName = "-XViewPatterns"
         , flagDescription = "Enable :ref:`view patterns <view-patterns>`."
         , flagType = DynamicFlag
         , flagReverse = "-XNoViewPatterns"
         , flagSince = "6.10.1"
         }
  ]
