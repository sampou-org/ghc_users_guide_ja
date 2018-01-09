..
   .. _options-sanity:

   Warnings and sanity-checking
   ----------------------------

   .. index::
      single: sanity-checking options
      single: warnings

.. _options-sanity:

警告と整合性検査
----------------

.. index::
   single: 整合性検査オプション
   single: 警告

..
   GHC has a number of options that select which types of non-fatal error
   messages, otherwise known as warnings, can be generated during
   compilation. By default, you get a standard set of warnings which are
   generally likely to indicate bugs in your program. These are:

   .. hlist::
       :columns: 3

       * :ghc-flag:`-Woverlapping-patterns`
       * :ghc-flag:`-Wwarnings-deprecations`
       * :ghc-flag:`-Wdeprecations`
       * :ghc-flag:`-Wdeprecated-flags`
       * :ghc-flag:`-Wunrecognised-pragmas`
       * :ghc-flag:`-Wduplicate-constraints`
       * :ghc-flag:`-Wduplicate-exports`
       * :ghc-flag:`-Woverflowed-literals`
       * :ghc-flag:`-Wempty-enumerations`
       * :ghc-flag:`-Wmissing-fields`
       * :ghc-flag:`-Wmissing-methods`
       * :ghc-flag:`-Wwrong-do-bind`
       * :ghc-flag:`-Wunsupported-calling-conventions`
       * :ghc-flag:`-Wdodgy-foreign-imports`
       * :ghc-flag:`-Winline-rule-shadowing`
       * :ghc-flag:`-Wunsupported-llvm-version`
       * :ghc-flag:`-Wtabs`
       * :ghc-flag:`-Wunrecognised-warning-flags`

GHC では，いくつものオプションを使って，コンパイル中の致命的ではないエラーに対して，
どのようなメッセージ(警告ともいいます)を生成するかを選択できます．
デフォルトでは，プログラム中のバグを示していることが多い以下の警告が有効になっています．

.. hlist::
    :columns: 3

    * :ghc-flag:`-Woverlapping-patterns`
    * :ghc-flag:`-Wwarnings-deprecations`
    * :ghc-flag:`-Wdeprecations`
    * :ghc-flag:`-Wdeprecated-flags`
    * :ghc-flag:`-Wunrecognised-pragmas`
    * :ghc-flag:`-Wduplicate-constraints`
    * :ghc-flag:`-Wduplicate-exports`
    * :ghc-flag:`-Woverflowed-literals`
    * :ghc-flag:`-Wempty-enumerations`
    * :ghc-flag:`-Wmissing-fields`
    * :ghc-flag:`-Wmissing-methods`
    * :ghc-flag:`-Wwrong-do-bind`
    * :ghc-flag:`-Wunsupported-calling-conventions`
    * :ghc-flag:`-Wdodgy-foreign-imports`
    * :ghc-flag:`-Winline-rule-shadowing`
    * :ghc-flag:`-Wunsupported-llvm-version`
    * :ghc-flag:`-Wtabs`
    * :ghc-flag:`-Wunrecognised-warning-flags`

..
   The following flags are simple ways to select standard "packages" of warnings:

   .. ghc-flag:: -W

       Provides the standard warnings plus

       .. hlist::
	   :columns: 3

	   * :ghc-flag:`-Wunused-binds`
	   * :ghc-flag:`-Wunused-matches`
	   * :ghc-flag:`-Wunused-foralls`
	   * :ghc-flag:`-Wunused-imports`
	   * :ghc-flag:`-Wincomplete-patterns`
	   * :ghc-flag:`-Wdodgy-exports`
	   * :ghc-flag:`-Wdodgy-imports`
	   * :ghc-flag:`-Wunbanged-strict-patterns`

以下のフラグは標準的な警告の「詰め合せ」を簡単に選択するためのものです．

.. ghc-flag:: -W

    標準の警告に加えて以下を有効にします．

    .. hlist::
        :columns: 3

        * :ghc-flag:`-Wunused-binds`
        * :ghc-flag:`-Wunused-matches`
        * :ghc-flag:`-Wunused-foralls`
        * :ghc-flag:`-Wunused-imports`
        * :ghc-flag:`-Wincomplete-patterns`
        * :ghc-flag:`-Wdodgy-exports`
        * :ghc-flag:`-Wdodgy-imports`
	* :ghc-flag:`-Wunbanged-strict-patterns`

..
   .. ghc-flag:: -Wall

       Turns on all warning options that indicate potentially suspicious
       code. The warnings that are *not* enabled by :ghc-flag:`-Wall` are

       .. hlist::
	   :columns: 3

	   * :ghc-flag:`-Wincomplete-uni-patterns`
	   * :ghc-flag:`-Wincomplete-record-updates`
	   * :ghc-flag:`-Wmonomorphism-restriction`
	   * :ghc-flag:`-Wimplicit-prelude`
	   * :ghc-flag:`-Wmissing-local-signatures`
	   * :ghc-flag:`-Wmissing-exported-signatures`
	   * :ghc-flag:`-Wmissing-import-lists`
	   * :ghc-flag:`-Wmissing-home-modules`
	   * :ghc-flag:`-Widentities`
	   * :ghc-flag:`-Wredundant-constraints`

.. ghc-flag:: -Wall

    疑わしいコードであることを示しうるすべての警告オプションを有効にします．
    :ghc-flag:`-Wall` で *有効にならない* 警告は以下のものです．

    .. hlist::
        :columns: 3

        * :ghc-flag:`-Wincomplete-uni-patterns`
        * :ghc-flag:`-Wincomplete-record-updates`
        * :ghc-flag:`-Wmonomorphism-restriction`
        * :ghc-flag:`-Wimplicit-prelude`
        * :ghc-flag:`-Wmissing-local-signatures`
        * :ghc-flag:`-Wmissing-exported-signatures`
        * :ghc-flag:`-Wmissing-import-lists`
	* :ghc-flag:`-Wmissing-home-modules`
	* :ghc-flag:`-Widentities`
	* :ghc-flag:`-Wredundant-constraints`

..
   .. ghc-flag:: -Wcompat

       Turns on warnings that will be enabled by default in the future, but remain
       off in normal compilations for the time being. This allows library authors
       eager to make their code future compatible to adapt to new features before
       they even generate warnings.

       This currently enables

       .. hlist::
	   :columns: 3

	   * :ghc-flag:`-Wmissing-monadfail-instances`
	   * :ghc-flag:`-Wsemigroup`
	   * :ghc-flag:`-Wnoncanonical-monoid-instances`

.. ghc-flag:: -Wcompat

    当面の間はデフォルトでは無効になっていますが，将来，デフォルトで有効になる予定の警告を有効にします．
    このフラグを有効にするとこで，ライブラリの作者は，警告を出さずに，新しい機能との互換性を確保しやすくなります．

    これで有効になるのは，現時点では以下の警告です．

    .. hlist::
        :columns: 3

        * :ghc-flag:`-Wmissing-monadfail-instances`
        * :ghc-flag:`-Wsemigroup`
        * :ghc-flag:`-Wnoncanonical-monoid-instances`

..
   .. ghc-flag:: -Wno-compat

       Disables all warnings enabled by :ghc-flag:`-Wcompat`.

.. ghc-flag:: -Wno-compat

    :ghc-flag:`-Wcompat` で有効になる警告をすべて無効にします．

..
   .. ghc-flag:: -w

       Turns off all warnings, including the standard ones and those that
       :ghc-flag:`-Wall` doesn't enable.

   These options control which warnings are considered fatal and cause compilation
   to abort.

.. ghc-flag:: -w

    標準警告に含まれないもの :ghc-flag:`-Wall` が有効にしないものを含めて，すべての警告を無効にします．

以下のオプションでは，警告をすべて致命的なものとみなし，コンパイルを中断します．

..
   .. ghc-flag:: -Werror

       Makes any warning into a fatal error. Useful so that you don't miss
       warnings when doing batch compilation.

.. ghc-flag:: -Werror

    すべての警告を致命的エラーにします．これを有効にすると，一括コンパイルのときに警告を見逃さずにすみます．

..
   .. ghc-flag:: -Werror=⟨wflag⟩
       :noindex:

       :implies: ``-W<wflag>``

       Makes a specific warning into a fatal error. The warning will be enabled if
       it hasn't been enabled yet.

.. ghc-flag:: -Werror=⟨wflag⟩
    :noindex:

    :implies: ``-W<wflag>``

    指定した警告を致命的エラーにします．これを指定しない警告はそのまま警告として使えます．

..
   .. ghc-flag:: -Wwarn

       Warnings are treated only as warnings, not as errors. This is the
       default, but can be useful to negate a :ghc-flag:`-Werror` flag.

.. ghc-flag:: -Wwarn

    警告を警告として扱い，エラーにはしません．これはデフォルトですが，
    :ghc-flag:`-Werror` フラグを否定するのに便利です．

..
   .. ghc-flag:: -Wwarn=⟨wflag⟩
       :noindex:

       Causes a specific warning to be treated as normal warning, not fatal error.

       Note that it doesn't fully negate the effects of ``-Werror=<wflag>`` - the
       warning will still be enabled.

.. ghc-flag:: -Wwarn=⟨wflag⟩
    :noindex:

    指定した警告を警告として扱い，エラーにはしません．

    ``-Werror=<wflag>`` を完全に否定するものではなく，警告としてそのまま使えます．

..
   When a warning is emitted, the specific warning flag which controls
   it is shown.

警告が発行されると，それを制御する警告フラグが表示されます．

..
   .. ghc-flag:: -fshow-warning-groups

       When showing which flag controls a warning, also show the
       respective warning group flag(s) that warning is contained in.

       This option is off by default.

.. ghc-flag:: -fshow-warning-groups

    どのフラグがその警告を制御しているかを表示する際，
    その警告を含む警告フラググループについても表示します．

    このオプションはデフォルトでは有効になっていません．

..
   The full set of warning options is described below. To turn off any
   warning, simply give the corresponding ``-Wno-...`` option on the
   command line. For backwards compatibility with GHC versions prior to 8.0,
   all these warnings can still be controlled with ``-f(no-)warn-*`` instead
   of ``-W(no-)*``.

以下に警告オプションのすべてを説明します．
なんらかの警告を無効にしたい場合には，その警告に対応する ``-Wno-...`` というオプションをコマンドラインで指定するといいでしょう．
いまのところ GHC 8.0 よりも前のバージョンとの後方互換性のために，すべての警告は ``-W(no-)*`` でなくても ``-f(no-)warn-*`` ででも制御できます．

..
   .. ghc-flag:: -Wunrecognised-warning-flags

       Enables warnings when the compiler encounters a ``-W...`` flag that is not
       recognised.

       This warning is on by default.

.. ghc-flag:: -Wunrecognised-warning-flags

    認識できない ``-W...`` フラグをコンパイラに指定したことを警告します．

    この警告はデフォルトで有効になっています．

..
   .. ghc-flag:: -Wtyped-holes

       Determines whether the compiler reports typed holes warnings. Has no
       effect unless typed holes errors are deferred until runtime. See
       :ref:`typed-holes` and :ref:`defer-type-errors`

       This warning is on by default.

.. ghc-flag:: -Wtyped-holes

    コンパイラが型付きホールの警告を出すかを決めます．
    型付きホールのエラーがランタイムまで遅延されているときにのみ効果があります．
    :ref:`typed-holes` および :ref:`defer-type-errors` を参照してください．

    この警告はデフォルトで有効になっています．

..
   .. ghc-flag:: -Wtype-errors

       Causes a warning to be reported when a type error is deferred until
       runtime. See :ref:`defer-type-errors`

       This warning is on by default.

.. ghc-flag:: -Wtype-errors

    型エラーが実行時まで遅延されているときに警告を出します．
    :ref:`defer-type-errors` を参照してください．

    この警告はデフォルトで有効になっています．

..
   .. ghc-flag:: -fdefer-type-errors

       :implies: :ghc-flag:`-fdefer-typed-holes`

       Defer as many type errors as possible until runtime. At compile time
       you get a warning (instead of an error). At runtime, if you use a
       value that depends on a type error, you get a runtime error; but you
       can run any type-correct parts of your code just fine. See
       :ref:`defer-type-errors`

.. ghc-flag:: -fdefer-type-errors

    :implies: :ghc-flag:`-fdefer-typed-holes`

    可能なかぎり多くの型エラーを実行時まで引き延ばします．
    コンパイル時にはエラーではなく警告がでます．
    実行時には，型エラーを起こす変数を使ったときに実行時エラーになります．
    しかし，型が正しい部分については，正しく動きます．
    :ref:`defer-type-errors` を参照してください．

..
   .. ghc-flag:: -fdefer-typed-holes

       Defer typed holes errors (errors about names with a leading underscore
       (e.g., “_”, “_foo”, “_bar”)) until runtime. This will turn the errors
       produced by :ref:`typed holes <typed-holes>` into warnings. Using a value
       that depends on a typed hole produces a runtime error, the same as
       :ghc-flag:`-fdefer-type-errors` (which implies this option). See :ref:`typed-holes`
       and :ref:`defer-type-errors`.

       Implied by :ghc-flag:`-fdefer-type-errors`. See also :ghc-flag:`-Wtyped-holes`.

.. ghc-flag:: -fdefer-typed-holes

    型付きホールのエラー(アンダースコアで始まる名前(たとえば ``_`` ， ``_foo`` ， ``_bar``)に関するエラー)を実行時まで遅延します．
    これは :ref:`typed holes <typed-holes>` によって起きたエラーを警告にします．
    型付きホールに依存する値を使うと :ghc-flag:`-fdefer-type-errors` (これを指定すると :ghc-flag:`-fdefer-typed-holes` が有効になる)のときと同じく実行時エラーになります．
    :ref:`typed-holes` および :ref:`defer-type-errors` を参照してください．

    :ghc-flag:`-fdefer-type-errors` によって有効になります． :ghc-flag:`-Wtyped-holes` も参照してください．

..
   .. ghc-flag:: -fdefer-out-of-scope-variables

       Defer variable out-of-scope errors (errors about names without a leading underscore)
       until runtime. This will turn variable-out-of-scope errors into warnings.
       Using a value that depends on a typed hole produces a runtime error,
       the same as :ghc-flag:`-fdefer-type-errors` (which implies this option).
       See :ref:`typed-holes` and :ref:`defer-type-errors`.

       Implied by :ghc-flag:`-fdefer-type-errors`. See also :ghc-flag:`-Wdeferred-out-of-scope-variables`.

.. ghc-flag:: -fdefer-out-of-scope-variables

    変数の有効範囲外エラー(アンダースコアで始まらない名前に関するエラー)を実行時まで遅延します．
    これは変数の有効範囲外エラーを警告に換えるものです．
    有効範囲外の変数に依存する値を使うと :ghc-flag:`-fdefer-type-errors` (これを指定すると :ghc-flag:`-fdefer-out-of-scope-variables`が有効になる)のときと同じく実行時エラーになります．
    :ref:`typed-holes` および :ref:`defer-type-errors` を参照してください．

    :ghc-flag:`-fdefer-type-errors` によって有効になります． :ghc-flag:`-Wdeferred-out-of-scope-variables` も参照してください．

..
   .. ghc-flag:: -Wdeferred-out-of-scope-variables

       Warn when a deferred out-of-scope variable is encountered.

.. ghc-flag:: -Wdeferred-out-of-scope-variables

    有効範囲外エラーが遅延されている変数に対して警告を出します．

..
   .. ghc-flag:: -Wpartial-type-signatures

       Determines whether the compiler reports holes in partial type
       signatures as warnings. Has no effect unless
       :ghc-flag:`-XPartialTypeSignatures` is enabled, which controls whether
       errors should be generated for holes in types or not. See
       :ref:`partial-type-signatures`.

       This warning is on by default.

.. ghc-flag:: -Wpartial-type-signatures

    部分型シグネチャ中にホールがあることをコンパイラが警告として報告するかを決定します．
    :ghc-flag:`-XPartialTypeSignatures` が有効になってい場合に限り効果があります．
    この言語拡張は型中のホールに関してエラーにするかどうかを制御します．
    :ref:`partial-type-signatures` を参照してください．

    この警告はデフォルトで有効になっています．

..
   .. ghc-flag:: -fhelpful-errors

       When a name or package is not found in scope, make suggestions for
       the name or package you might have meant instead.

       This option is on by default.

.. ghc-flag:: -fhelpful-errors

    名前やパッケージが有効範囲になければ，意図していたと推測した名前やパッケージを提案します．

    このオプションはデフォルトで有効になっています．

..
   .. ghc-flag:: -Wunrecognised-pragmas

       Causes a warning to be emitted when a pragma that GHC doesn't
       recognise is used. As well as pragmas that GHC itself uses, GHC also
       recognises pragmas known to be used by other tools, e.g.
       ``OPTIONS_HUGS`` and ``DERIVE``.

       This option is on by default.

.. ghc-flag:: -Wunrecognised-pragmas

    GHC が認識できないプラグマが使われたときに警告を発します．
    GHC 自身が使うプラグマだけではなく，他のツールが使うことが判っているプラグマも認識します．
    たとえば ``OPTIONS_HUGS`` や ``DERIVE`` がそれにあたります．

    このオプションはデフォルトで有効になっています．

..
   .. ghc-flag:: -Wmissed-specialisations
		 -Wall-missed-specialisations

       Emits a warning if GHC cannot specialise an overloaded function, usually
       because the function needs an ``INLINABLE`` pragma. The "all" form reports
       all such situations whereas the "non-all" form only reports when the
       situation arises during specialisation of an imported function.

       The "non-all" form is intended to catch cases where an imported function
       that is marked as ``INLINABLE`` (presumably to enable specialisation) cannot
       be specialised as it calls other functions that are themselves not specialised.

       Note that these warnings will not throw errors if used with :ghc-flag:`-Werror`.

       These options are both off by default.

.. ghc-flag:: -Wmissed-specialisations
              -Wall-missed-specialisations

    GHC が多重定義された関数を特定化できない場合に警告を発します．
    通常そのような関数は ``INLINEABLE`` プラグマが必要だからです．
    「all」付きの形式で指定した場合は，そうなる状況すべてを報告します．
    「all」が付かない形式ではインポートされた関数の特定化過程で起りうる状況についてのみ報告します．

    「all」が付かない形式は(おそらく特定化可能であるということで) ``INLINABLE`` がついたインポートされた関数が，
    特定化されていない別の関数を呼んでいるために，特定できないという場合を捕捉するためのものです．

    これらの警告は :ghc-flag:`-Werror` を使ってもエラーにはならないことに注意してください．

    これらのオプションはデフォルトでは無効です．

..
   .. ghc-flag:: -Wwarnings-deprecations

       .. index::
	  pair: deprecations; warnings

       Causes a warning to be emitted when a module, function or type with
       a ``WARNING`` or ``DEPRECATED pragma`` is used. See
       :ref:`warning-deprecated-pragma` for more details on the pragmas.

       This option is on by default.

.. ghc-flag:: -Wwarnings-deprecations

    .. index::
       pair: 非推奨; 〜警告

    ``WARNING`` あるいは ``DEPRECATED`` プラグマの付いたモジュール，関数，型を使ったときに警告を発行します．
    対応するプラグマについて詳しくは :ref:`warning-deprecated-pragma` を参照してください．

    このオプションはデフォルトで有効です．

..
   .. ghc-flag:: -Wdeprecations

       .. index::
	  single: deprecations

       Causes a warning to be emitted when a module, function or type with
       a ``WARNING`` or ``DEPRECATED pragma`` is used. See
       :ref:`warning-deprecated-pragma` for more details on the pragmas.
       An alias for :ghc-flag:`-Wwarnings-deprecations`.

       This option is on by default.

.. ghc-flag:: -Wdeprecations

    .. index::
       single: 非推奨

    ``WARNING`` あるいは ``DEPRECATED`` プラグマの付いたモジュール，関数，型を使ったときに警告を発行します．
    対応するプラグマについて詳しくは :ref:`warning-deprecated-pragma` を参照してください．
    これは :ghc-flag:`-Wwarnings-deprecations` の別名です．

    このオプションはデフォルトで有効です．

..
   .. ghc-flag:: -Wamp

       .. index::
	  single: AMP
	  single: Applicative-Monad Proposal

       This option is deprecated.

       Caused a warning to be emitted when a definition was in conflict with
       the AMP (Applicative-Monad proosal).

.. ghc-flag:: -Wamp

    .. index::
       single: AMP
       single: Applicative-Monad Proposal

    このオプションは廃止予定で非推奨です．

    AMP (Applicative-Monad proosal)と衝突する定義があった場合に警告を発行します．

..
   .. ghc-flag:: -Wnoncanonical-monad-instances

       Warn if noncanonical ``Applicative`` or ``Monad`` instances
       declarations are detected.

       When this warning is enabled, the following conditions are verified:

       In ``Monad`` instances declarations warn if any of the following
       conditions does not hold:

	* If ``return`` is defined it must be canonical (i.e. ``return = pure``).
	* If ``(>>)`` is defined it must be canonical (i.e. ``(>>) = (*>)``).

       Moreover, in ``Applicative`` instance declarations:

	* Warn if ``pure`` is defined backwards (i.e. ``pure = return``).
	* Warn if ``(*>)`` is defined backwards (i.e. ``(*>) = (>>)``).

       This option is off by default.

.. ghc-flag:: -Wnoncanonical-monad-instances

    非標準の ``Applicative`` あるいは ``Monad`` インスタンス宣言を検出した場合に警告を発行します．

    この警告が有効になっている場合は，以下の条件を確認します．

    ``Monad`` のインスタンス宣言において，以下の条件が満たされていなければ警告になります．

     * ``return`` が定義されているなら，標準的定義(すなわち ``return = pure``)でなければならない．
     * ``(>>)`` が定義されているなら，標準的定義(すなわち ``(>>) = (*>)``)でなければならない．

    さらに ``Applicative`` のインスタンス定義においては，

     * ``pure`` が逆方向定義(すなわち ``pure = return``) であれば警告します．
     * ``(*>)`` が逆方向定義(すなわち ``(*>) = (>>)``)であれば警告します．

    このオプションはデフォルトでは無効です．

..
   .. ghc-flag:: -Wnoncanonical-monadfail-instances

       Warn if noncanonical ``Monad`` or ``MonadFail`` instances
       declarations are detected.

       When this warning is enabled, the following conditions are verified:

       In ``Monad`` instances declarations warn if any of the following
       conditions does not hold:

	* If ``fail`` is defined it must be canonical
	  (i.e. ``fail = Control.Monad.Fail.fail``).

       Moreover, in ``MonadFail`` instance declarations:

	* Warn if ``fail`` is defined backwards
	  (i.e. ``fail = Control.Monad.fail``).

       See also :ghc-flag:`-Wmissing-monadfail-instances`.

       This option is off by default.

.. ghc-flag:: -Wnoncanonical-monadfail-instances

    ``Monad`` あるいは ``MonadFail`` のインスタンス宣言が標準的ではない場合に警告を発行します．

    この警告が有効になっている場合は，以下の条件を確認します．

    ``Monad`` のインスタンス宣言において，以下の条件が満されていなければ警告になります．

     * ``fail`` が定義されているなら，標準的定義(すなわち ``fail = Control.Monad.Fail.fail``)でなければならない．

    さらに ``MonadFail`` のインスタンス定義においては，

     * ``fail`` が逆方向定義(すなわち ``fail = Control.Monad.fail``)であれば警告します．

    :ghc-flag:`-Wmissing-monadfail-instances` も参照してください．

    このオプションはデフォルトでは無効です．

..
   .. ghc-flag:: -Wnoncanonical-monoid-instances

       Warn if noncanonical ``Semigroup`` or ``Monoid`` instances
       declarations are detected.

       When this warning is enabled, the following conditions are verified:

       In ``Monoid`` instances declarations warn if any of the following
       conditions does not hold:

	* If ``mappend`` is defined it must be canonical
	  (i.e. ``mappend = (Data.Semigroup.<>)``).

       Moreover, in ``Semigroup`` instance declarations:

	* Warn if ``(<>)`` is defined backwards (i.e. ``(<>) = mappend``).

       This warning is off by default. However, it is part of the
       :ghc-flag:`-Wcompat` option group.

.. ghc-flag:: -Wnoncanonical-monoid-instances
			       
    ``Semigroup`` あるいは ``Monoid`` のインスタンス宣言が標準的でないときに警告を発行します．

    この警告が有効になっている場合は，以下の条件を確認します．

    ``Monoid`` のインスタンス宣言において，以下の条件が満たされていなければ警告になります．

     * ``mappend`` が定義されているなら，標準的定義(すなわち ``mappend = (Data.Semigroup.<>)``)でなければならない．

    さらに ``Semigroup`` のインスタンス宣言において

     * ``(<>)`` が逆方向定義(すなわち ``(<>) = mappend``)であれば警告します．

    この警告はデフォルトでは無効になっています．しかし，この警告は :ghc-flag:`-Wcompat` というオプショングループに属しています．

..
   .. ghc-flag:: -Wmissing-monadfail-instances

       .. index::
	  single: MFP
	  single: MonadFail Proposal

       Warn when a failable pattern is used in a do-block that does not have a
       ``MonadFail`` instance.

       See also :ghc-flag:`-Wnoncanonical-monadfail-instances`.

       Being part of the :ghc-flag:`-Wcompat` option group, this warning is off by
       default, but will be switched on in a future GHC release, as part of
       the `MonadFail Proposal (MFP)
       <https://prime.haskell.org/wiki/Libraries/Proposals/MonadFail>`__.

.. ghc-flag:: -Wmissing-monadfail-instances

    .. index::
       single: MFP
       single: MonadFail Proposal

    do ブロックで失敗する可能性のあるパターンが用いられていて ``MonadFail`` のインスタンスではないときに警告を発行します．

    :ghc-flag:`-Wnoncanonical-monadfail-instances` も参照してください．

    この警告フラグは :ghc-flag:`-Wcompat` というオプショングループに属していていますが，
    デフォルトでは無効になっています．しかし，将来のリリースでは `MonadFail Proposal (MFP) <https://prime.haskell.org/wiki/Libraries/Proposals/MonadFail>`__ の一部としてデフォルトで有効になる予定です．

..
   .. ghc-flag:: -Wsemigroup

       .. index::
	  single: semigroup; warning

       Warn when definitions are in conflict with the future inclusion of
       ``Semigroup`` into the standard typeclasses.

	1. Instances of ``Monoid`` should also be instances of ``Semigroup``
	2. The ``Semigroup`` operator ``(<>)`` will be in ``Prelude``, which
	   clashes with custom local definitions of such an operator

       Being part of the :ghc-flag:`-Wcompat` option group, this warning is off by
       default, but will be switched on in a future GHC release.

.. ghc-flag:: -Wsemigroup

    .. index::
       single: semigroup; 〜の警告

    将来，標準の型クラスに ``Semigroup`` が含まれるようになったときに，衝突を引き起す定義に対して警告を出します．

     1. ``Monoid`` のインスタンスは，``Semigroup`` のインスタンスでもなければなりません．
     2. ``Semigroup`` の演算子 ``(<>)`` は ``Prelude`` に入る予定ですので，このような演算子を独自に定義しているとクラッシュします．

    このフラグは :ghc-flag:`-Wcompat` オプショングループに属しています．デフォルトでは無効になっていますが，
    将来の GHC のリリースでは，デフォルトで有効になります．

..
   .. ghc-flag:: -Wdeprecated-flags

       .. index::
	  single: deprecated flags

       Causes a warning to be emitted when a deprecated command-line flag
       is used.

       This option is on by default.

.. ghc-flag:: -Wdeprecated-flags

    .. index::
       single: 非推奨フラグ

    非推奨になっているコマンドラインを使っていると警告を発行します．

    このオプションはデフォルトで有効です．

..
   .. ghc-flag:: -Wunsupported-calling-conventions

       Causes a warning to be emitted for foreign declarations that use
       unsupported calling conventions. In particular, if the ``stdcall``
       calling convention is used on an architecture other than i386 then
       it will be treated as ``ccall``.

.. ghc-flag:: -Wunsupported-calling-conventions

    サポートされていない呼び出し方法を外部宣言で用いると警告を発行します．
    具体的には ``stdcall`` という呼び出し方法を i386 以外のアーキテクチャ上のシステムで使うと
    ``ccall`` として扱います．

..
   .. ghc-flag:: -Wdodgy-foreign-imports

       Causes a warning to be emitted for foreign imports of the following
       form: ::

	   foreign import "f" f :: FunPtr t

       on the grounds that it probably should be ::

	   foreign import "&f" f :: FunPtr t

       The first form declares that \`f\` is a (pure) C function that takes
       no arguments and returns a pointer to a C function with type \`t\`,
       whereas the second form declares that \`f\` itself is a C function
       with type \`t\`. The first declaration is usually a mistake, and one
       that is hard to debug because it results in a crash, hence this
       warning.

.. ghc-flag:: -Wdodgy-foreign-imports

    以下の形式の外部インポートに対して警告を発行します． ::

        foreign import "f" f :: FunPtr t

    おそらく ::

        foreign import "&f" f :: FunPtr t

    と書くべきだったと思われます．
    1つめの形式では \`f\` は(純粋な) C の関数で，引数はとらず，型 \`t\` の C の関数へのポインタを宣言しています．
    1つめの宣言は通常は誤りで，クラッシュにつながりデバッグのしにくいバグになるので，この警告が用意されています．

..
   .. ghc-flag:: -Wdodgy-exports

       Causes a warning to be emitted when a datatype ``T`` is exported
       with all constructors, i.e. ``T(..)``, but is it just a type
       synonym.

       Also causes a warning to be emitted when a module is re-exported,
       but that module exports nothing.

.. ghc-flag:: -Wdodgy-exports

    型シノニムにすぎないデータ型 ``T`` がすべての構成子を ``T(..)`` のようにエクスポートしているときに警告を発行します．

    また，何もエクスポートしていないモジュールを再エクスポートしているときも警告を発行します．

..
   .. ghc-flag:: -Wdodgy-imports

       Causes a warning to be emitted in the following cases:

       -  When a datatype ``T`` is imported with all constructors, i.e.
	  ``T(..)``, but has been exported abstractly, i.e. ``T``.

       -  When an ``import`` statement hides an entity that is not
	  exported.

.. ghc-flag:: -Wdodgy-imports

    以下の場合に警告を発行します．

    -  データ型 ``T`` を ``T(..)`` のようにすべての構成子付きでインポートしているのに，その型が ``T`` のように
       抽象的にしかエクスポートされていない場合．		 

    -  ``import`` 宣言がエクスポートされていない実体を隠蔽している場合．

..
   .. ghc-flag:: -Woverflowed-literals

       Causes a warning to be emitted if a literal will overflow, e.g.
       ``300 :: Word8``.

.. ghc-flag:: -Woverflowed-literals

    リテラルがオーバーフローを起こすような場合，たとえば ``300 :: Word8`` のような場合に警告を発行します．

..
   .. ghc-flag:: -Wempty-enumerations

       Causes a warning to be emitted if an enumeration is empty, e.g.
       ``[5 .. 3]``.

.. ghc-flag:: -Wempty-enumerations

    たとえば ``[5 .. 3]`` のように列挙が空になる場合に警告を発行します．

..
   .. ghc-flag:: -Wduplicate-constraints

       .. index::
	  single: duplicate constraints, warning

       Have the compiler warn about duplicate constraints in a type
       signature. For example ::

	   f :: (Eq a, Show a, Eq a) => a -> a

       The warning will indicate the duplicated ``Eq a`` constraint.

       This option is now deprecated in favour of
       :ghc-flag:`-Wredundant-constraints`.

.. ghc-flag:: -Wduplicate-constraints

    .. index::
       single: 重複のある制約, 〜の警告

    型シグネチャで制約の重複がある場合コンパイラが警告を発行するようにします．
    たとえば，以下のような場合です． ::

        f :: (Eq a, Show a, Eq a) => a -> a

    この警告では ``Eq a`` という制約が重複していることを表示します．

    このオプションは :ghc-flag:`-Wredundant-constraints` があるので，非推奨になっています．

..
   .. ghc-flag:: -Wredundant-constraints

       :since: 8.0

       .. index::
	  single: redundant constraints, warning

       Have the compiler warn about redundant constraints in a type
       signature. In particular:

       -  A redundant constraint within the type signature itself: ::

	       f :: (Eq a, Ord a) => a -> a

	  The warning will indicate the redundant ``Eq a`` constraint: it
	  is subsumed by the ``Ord a`` constraint.

       -  A constraint in the type signature is not used in the code it
	  covers: ::

	       f :: Eq a => a -> a -> Bool
	       f x y = True

	  The warning will indicate the redundant ``Eq a`` constraint: : it
	  is not used by the definition of ``f``.)

       Similar warnings are given for a redundant constraint in an instance
       declaration.

       This option is on by default. As usual you can suppress it on a
       per-module basis with :ghc-flag:`-Wno-redundant-constraints <-Wredundant-constraints>`.
       Occasionally you may specifically want a function to have a more
       constrained signature than necessary, perhaps to leave yourself
       wiggle-room for changing the implementation without changing the
       API. In that case, you can suppress the warning on a per-function
       basis, using a call in a dead binding. For example: ::

	   f :: Eq a => a -> a -> Bool
	   f x y = True
	   where
	       _ = x == x  -- Suppress the redundant-constraint warning for (Eq a)

       Here the call to ``(==)`` makes GHC think that the ``(Eq a)``
       constraint is needed, so no warning is issued.

.. ghc-flag:: -Wredundant-constraints

    :since: 8.0

    .. index::
       single: 冗長な制約, 〜の警告

    型シグネチャで冗長な制約がある場合にコンパイラが警告を発行するようにします．
    具体的には，

    -  型シグネチャ内に冗長な制約がある場合． ::

            f :: (Eq a, Ord a) => a -> a

       この警告では ``Eq a`` という警告が冗長であることが表示されます．
       ``Ord a`` 制約によって ``Eq a`` 制約は仮定済みになるからです．

    -  型シグネチャ内の制約がカバーする範囲のコードで，その制約が使われていない場合． ::

            f :: Eq a => a -> a -> Bool
            f x y = True

       この警告では ``Eq a`` という制約が冗長であることが示されます．
       (この制約は ``f`` の定義で使われていません．)

    インスタンス宣言中に冗長な制約がある場合についても同様の警告がでます．

    このオプションはデフォルトで有効です．
    通常どおり :ghc-flag:`-Wno-redundant-constraints <-Wredundant-constraints>` を使えば，モジュール毎にこの警告を抑制できます．
    必要とされる以上の制約を加えた型シグネチャを書きたい場合には，APIを変更することなく，実装を変更する余地が残されています．
    そのような場合には，使われない束縛を使って，関数ごとに警告を抑制できます．
    たとえば，以下のようにします．  ::

        f :: Eq a => a -> a -> Bool
        f x y = True
        where
            _ = x == x  -- (Eq a)に対する冗長な制約警告を抑制

    ここでは ``(==)`` を呼び出すことで，GHC は ``(Eq a)`` という制約が必要であると判断しますので，警告は発行されません．

..
   .. ghc-flag:: -Wduplicate-exports

       .. index::
	  single: duplicate exports, warning
	  single: export lists, duplicates

       Have the compiler warn about duplicate entries in export lists. This
       is useful information if you maintain large export lists, and want
       to avoid the continued export of a definition after you've deleted
       (one) mention of it in the export list.

       This option is on by default.

.. ghc-flag:: -Wduplicate-exports

    .. index::
       single: 重複エクスポート, 〜の警告
       single: エクスポートリスト, 〜での重複

    エクスポートリストに重複したエントリがある場合にコンパイラが警告を発行するようにします．
    この機能は大きなエクスポートリストを保守するのに便利です．
    削除したはずのエクスポートリストのエントリがエクスポートされつづけるというようなことを避けられます．

    このオプションはデフォルトで有効です．

..
   .. ghc-flag:: -Whi-shadowing

       .. index::
	  single: shadowing; interface files

       Causes the compiler to emit a warning when a module or interface
       file in the current directory is shadowing one with the same module
       name in a library or other directory.

.. ghc-flag:: -Whi-shadowing

    .. index::
       single: シャドーイング; インターフェイスファイルの〜

    現在のディレクトリにあるモジュールやインターフェイスファイルが，ライブラリや別のディレクトリにある同名のモジュールをシャドーイングしてしまっている場合，コンパイラが警告を発行するようになります．

..
   .. ghc-flag:: -Widentities

       Causes the compiler to emit a warning when a Prelude numeric
       conversion converts a type ``T`` to the same type ``T``; such calls are
       probably no-ops and can be omitted. The functions checked for are:
       ``toInteger``, ``toRational``, ``fromIntegral``, and ``realToFrac``.

.. ghc-flag:: -Widentities

    Prelude の数値変換が ``T`` 型の値を同じ ``T``型の値に変換しようとしている場合に，コンパイラが警告を発行するようになります．
    このような呼び出しは何もしないのと同じで省略できます．
    検査される関数は  ``toInteger`` ， ``toRational`` ， ``fromIntegral`` ， ``realToFrac`` です．

..
   .. ghc-flag:: -Wimplicit-prelude

       .. index::
	  single: implicit prelude, warning

       Have the compiler warn if the Prelude is implicitly imported. This
       happens unless either the Prelude module is explicitly imported with
       an ``import ... Prelude ...`` line, or this implicit import is
       disabled (either by :ghc-flag:`-XNoImplicitPrelude` or a
       ``LANGUAGE NoImplicitPrelude`` pragma).

       Note that no warning is given for syntax that implicitly refers to
       the Prelude, even if :ghc-flag:`-XNoImplicitPrelude` would change whether it
       refers to the Prelude. For example, no warning is given when ``368``
       means ``Prelude.fromInteger (368::Prelude.Integer)`` (where
       ``Prelude`` refers to the actual Prelude module, regardless of the
       imports of the module being compiled).

       This warning is off by default.

.. ghc-flag:: -Wimplicit-prelude

    .. index::
       single: 暗黙のPrelude, 〜警告

    Preludeが暗黙に(インポート宣言なしで)インポートされる場合にコンパイラが警告を発行するようにします．
    Prelude の暗黙のインポートは ``import ... Prelude ...`` というインポート宣言で明示的にインポートされている場合や，
    暗黙のインポートが(:ghc-flag:`-XNoImplicitPrelude` あるいは ``LANGUAGE NoImplicitPrelude`` プラグマにより)無効になっている場合を除きいつでも起ります．

    Preludeを暗黙に参照する構文に対して警告が出るわけではありません．
    :ghc-flag:`-XNoImplicitPrelude` によって Preludeを参照するかどうかが変化するような場合でも警告は出ません．
    たとえば ``368`` は ``Prelude.fromInteger (368::Prelude.Integer)`` という意味であっても警告はでないということに注意してください．
    ここで ``Prelude`` はコンパイル中のモジュールが何をインポートしているかにかかわらず，実際のPreludeモジュールを参照します．

    この警告はデフォルトでは無効です．

..
   .. ghc-flag:: -Wincomplete-patterns
		 -Wincomplete-uni-patterns

       .. index::
	  single: incomplete patterns, warning
	  single: patterns, incomplete

       The option :ghc-flag:`-Wincomplete-patterns` warns about places where a
       pattern-match might fail at runtime. The function ``g`` below will
       fail when applied to non-empty lists, so the compiler will emit a
       warning about this when :ghc-flag:`-Wincomplete-patterns` is enabled. ::

	   g [] = 2

       This option isn't enabled by default because it can be a bit noisy,
       and it doesn't always indicate a bug in the program. However, it's
       generally considered good practice to cover all the cases in your
       functions, and it is switched on by :ghc-flag:`-W`.

       The flag :ghc-flag:`-Wincomplete-uni-patterns` is similar, except that
       it applies only to lambda-expressions and pattern bindings,
       constructs that only allow a single pattern: ::

	   h = \[] -> 2
	   Just k = f y

.. ghc-flag:: -Wincomplete-patterns
              -Wincomplete-uni-patterns

    .. index::
       single: 不完全パターン, 〜警告
       single: パターン, 不完全な〜

    :ghc-flag:`-Wincomplete-patterns` はパターン照合が実行時に失敗する可能性がある場合に警告を発行します．
    以下の関数 ``g`` は空ではないリストに適用すると失敗するので :ghc-flag:`-Wincomplete-patterns` が有効ならコンパイラは警告を発行します． ::

        g [] = 2

    このオプションは小うるさいことがあり，また常にバグを示しているわけもないので，デフォルトでは有効になっていません．
    しかし，関数を定義するときにはすべての場合を網羅するのが一般的に良い習慣です．
    このオプションは :ghc-flag:`-W` で有効になります．

    :ghc-flag:`-Wincomplete-uni-patterns` というフラグは，単一パターンしか許されない構文要素，つまりλ抽象式およびパターン束縛にのみ適用されるという点を除けば :ghc-flag:`-Wincomplete-patterns` と同じである． ::

        h = \[] -> 2
        Just k = f y

..
   .. ghc-flag:: -fmax-pmcheck-iterations=⟨n⟩

       :default: 2000000

       Sets how many iterations of the pattern-match checker will perform before
       giving up. This limit is to catch cases where pattern-match checking might
       be excessively costly (due to the exponential complexity of coverage
       checking in the general case). It typically shouldn't be necessary to set
       this unless GHC informs you that it has exceeded the pattern match checker's
       iteration limit (in which case you may want to consider refactoring your
       pattern match, for the sake of future readers of your code.

.. ghc-flag:: -fmax-pmcheck-iterations=<N>

    :default: 2000000

    パターン照合検査器が諦めるまでの反復回数を設定します．
    この制限はパターン照合が(一般的な場合の検査範囲のカバー率が指数オーダーになるなど)極端にコストがかかるような場合を捕捉するためのものです．
    GHC がパターン照合検査器の反復限界を超えたと報告しないかぎり，通常は設定する必要はありません．
    (そのような場合には，将来そのコードを読む人のために，パターン照合の部分のリファクタリングを考えることになるでしょう．)

..
   .. ghc-flag:: -Wincomplete-record-updates

       .. index::
	  single: incomplete record updates, warning
	  single: record updates, incomplete

       The function ``f`` below will fail when applied to ``Bar``, so the
       compiler will emit a warning about this when
       :ghc-flag:`-Wincomplete-record-updates` is enabled. ::

	   data Foo = Foo { x :: Int }
		    | Bar

	   f :: Foo -> Foo
	   f foo = foo { x = 6 }

       This option isn't enabled by default because it can be very noisy,
       and it often doesn't indicate a bug in the program.

.. ghc-flag:: -Wincomplete-record-updates

    .. index::
       single: 不完全なレコードの更新, 〜警告
       single: レコードの更新, 不完全な〜

    以下の関数 ``f`` は ``Bar`` に適用すると失敗します．
    :ghc-flag:`-Wincomplete-record-updates` を有効にしておくと，この場合に警告が発行されます． ::

        data Foo = Foo { x :: Int }
                 | Bar

        f :: Foo -> Foo
        f foo = foo { x = 6 }

    このオプションは小うるさく，プログラムのバグを示さないことも多いので，デフォルトでは有効になっていません．

..
   .. ghc-flag:: -Wmissing-fields

       .. index::
	  single: missing fields, warning
	  single: fields, missing

       This option is on by default, and warns you whenever the
       construction of a labelled field constructor isn't complete, missing
       initialisers for one or more fields. While not an error (the missing
       fields are initialised with bottoms), it is often an indication of a
       programmer error.

.. ghc-flag:: -Wmissing-fields

    .. index::
       single: フィールドの欠如, 〜警告
       single: フィールド, 〜の欠如

    このオプションはデフォルトで有効です．
    ラベル付きフィールド構成子を構成するときに，1つ以上のフィールドについて初期化子が欠如している場合に警告を発行します．
    これはエラーではありません(省略されたフィールドはボトムで初期化されます)が，多くの場合プログラムに誤りがあることを示します．

..
   .. ghc-flag:: -Wmissing-import-lists

       .. index::
	  single: missing import lists, warning
	  single: import lists, missing

       This flag warns if you use an unqualified ``import`` declaration
       that does not explicitly list the entities brought into scope. For
       example ::

	   module M where
	     import X( f )
	     import Y
	     import qualified Z
	     p x = f x x

       The :ghc-flag:`-Wmissing-import-lists` flag will warn about the import of
       ``Y`` but not ``X`` If module ``Y`` is later changed to export (say) ``f``,
       then the reference to ``f`` in ``M`` will become ambiguous. No warning is
       produced for the import of ``Z`` because extending ``Z``\'s exports would be
       unlikely to produce ambiguity in ``M``.

.. ghc-flag:: -Wmissing-import-lists

    .. index::
       single: インポートリストの欠如, 〜警告
       single: インポートリスト, 〜の欠如

    qualified ではない ``import`` 宣言で，スコープに持ち込む実体を明示的に列挙していないインポート宣言に対して警告を発行する．
    たとえば ::

        module M where
          import X( f )
          import Y
          import qualified Z
          p x = f x x

    :ghc-flag:`-Wmissing-import-lists` フラグが有効なら ``Y`` のインポートに対して警告が発行されます．
    ``X`` については警告はでません．
    後から ``Y`` がたとえば ``f`` をエクスポートするように変更されると ``M`` の中での ``f`` への参照は曖昧になってしまいます．
    ``Z`` のエクスポートを拡張しても ``M`` で曖昧な部分ができる可能性は低いので ``Z`` をインポートすることについては警告はでません．

..
   .. ghc-flag:: -Wmissing-methods

       .. index::
	  single: missing methods, warning
	  single: methods, missing

       This option is on by default, and warns you whenever an instance
       declaration is missing one or more methods, and the corresponding
       class declaration has no default declaration for them.

       The warning is suppressed if the method name begins with an
       underscore. Here's an example where this is useful: ::

	   class C a where
	       _simpleFn :: a -> String
	       complexFn :: a -> a -> String
	       complexFn x y = ... _simpleFn ...

       The idea is that: (a) users of the class will only call
       ``complexFn``; never ``_simpleFn``; and (b) instance declarations
       can define either ``complexFn`` or ``_simpleFn``.

       The ``MINIMAL`` pragma can be used to change which combination of
       methods will be required for instances of a particular class. See
       :ref:`minimal-pragma`.

.. ghc-flag:: -Wmissing-methods

    .. index::
       single: メソッドの欠如, 〜警告
       single: メソッド, 〜の欠如

    このオプションはデフォルトで有効です．
    インスタンス宣言が1つ以上のメソッドを欠き，そのメソッドのデフォルト定義が対応するクラス宣言にないときに警告を発行します．
    
    メソッド名がアンダースコアで始まっているときにはこの警告はでません．
    このことは以下のような場合に便利です． ::

        class C a where
            _simpleFn :: a -> String
            complexFn :: a -> a -> String
            complexFn x y = ... _simpleFn ...

    基本的な考え方は (a) クラスの利用者はもっぱら ``complexFn`` を呼び ``_simpleFn`` を呼ぶことはなく，かつ，
    (b) インスタンス宣言では ``complexFn`` か ``_simpleFn`` のどちらか一方を定義すればよいということです．

    ``MINIMAL`` プラグマを使うと，特定のクラスに対して，どのメソッドの組み合わせが要求されるかを変更できます．
    詳しくは :ref:`minimal-pragma` を参照してください．

..
   .. ghc-flag:: -Wmissing-signatures

       .. index::
	  single: type signatures, missing

       If you would like GHC to check that every top-level function/value
       has a type signature, use the :ghc-flag:`-Wmissing-signatures` option.
       As part of the warning GHC also reports the inferred type. The
       option is off by default.

.. ghc-flag:: -Wmissing-signatures

    .. index::
       single: 型シグネチャ, 〜の欠如

    どのトップレベルの関数や値にも型シグネチャがあることを GHC に確認させたければ，
    :ghc-flag:`-Wmissing-signatures` オプションを使うのがよいでしょう．
    GHC はこの警告の一部として，推論できた型を報告します．
    このオプションはデフォルトでは無効になっています．

..
   .. ghc-flag:: -Wmissing-exported-sigs

       .. index::
	  single: type signatures, missing

       This option is now deprecated in favour of
       :ghc-flag:`-Wmissing-exported-signatures`.

.. ghc-flag:: -Wmissing-exported-sigs

    .. index::
       single: 型シグネチャ, 〜の欠如

    このオプションは :ghc-flag:`-Wmissing-exported-signatures` があるので，非推奨となっています．

..
   .. ghc-flag:: -Wmissing-exported-signatures

       .. index::
	  single: type signatures, missing

       If you would like GHC to check that every exported top-level
       function/value has a type signature, but not check unexported
       values, use the :ghc-flag:`-Wmissing-exported-signatures`
       option. This option takes precedence over
       :ghc-flag:`-Wmissing-signatures`. As part of the warning GHC also
       reports the inferred type. The option is off by default.

.. ghc-flag:: -Wmissing-exported-signatures

    .. index::
       single: 型シグネチャ, 〜の欠如

    エクスポートされるどのトップレベルの関数や値にも型シグネチャがあることを GHC に確認させ，
    エクスポートしないトップレベルの関数や値については確認しないということをしたければ :ghc-flag:`-Wmissing-exported-signatures` オプションを使うのが良いでしょう．
    このオプションは :ghc-flag:`-Wmissing-signatures` より優先されます．
    この警告の一部として GHC は推論できた型を報告します．
    このオプションはデフォルトでは無効になっています．

..
   .. ghc-flag:: -Wmissing-local-sigs

       .. index::
	  single: type signatures, missing

       This option is now deprecated in favour of
       :ghc-flag:`-Wmissing-local-signatures`.

.. ghc-flag:: -Wmissing-local-sigs

    .. index::
       single: 型シグネチャ, 〜の欠如

    このオプションは :ghc-flag:`-Wmissing-local-signatures` があるので，非推奨となっています．

..
   .. ghc-flag:: -Wmissing-local-signatures

       .. index::
	  single: type signatures, missing

       If you use the :ghc-flag:`-Wmissing-local-signatures` flag GHC
       will warn you about any polymorphic local bindings. As part of the
       warning GHC also reports the inferred type. The option is off by
       default.

.. ghc-flag:: -Wmissing-local-signatures

    .. index::
       single: 型シグネチャ, 〜の欠如

    :ghc-flag:`-Wmissing-local-signatures` を使えば，GHC はあらゆる多相的な局所束縛について警告を発行するようになります．
    警告の一部として，GHC は推論できた型を報告します．
    このオプションはデフォルトでは無効です．

..
   .. ghc-flag:: -Wmissing-pattern-synonym-signatures

       .. index::
	    single: type signatures, missing, pattern synonyms

       If you would like GHC to check that every pattern synonym has a
       type signature, use the
       :ghc-flag:`-Wmissing-pattern-synonym-signatures` option. If this
       option is used in conjunction with
       :ghc-flag:`-Wmissing-exported-signatures` then only exported pattern
       synonyms must have a type signature. GHC also reports the inferred
       type. This option is off by default.

.. ghc-flag:: -Wmissing-pattern-synonym-signatures

    .. index::
       single: 型シグネチャ, 〜の欠如, パターンシノニムの〜

    どのパターンシノニムにも型シグネチャがあることを GHC に確認させたければ，
    :ghc-flag:`-Wmissing-pattern-synonym-signatures` オプションを使うのが良いでしょう．
    オプションを :ghc-flag:`-Wmissing-exported-signatures` と同時に使えば，エクスポートするパターンシノニムだけが型シグネチャを付けなければならなくなります．
    警告の一部として，GHC は推論できた型も報告します．
    このオプションはデフォルトでは無効になっています．

..
   .. ghc-flag:: -Wname-shadowing

       .. index::
	  single: shadowing, warning

       This option causes a warning to be emitted whenever an inner-scope
       value has the same name as an outer-scope value, i.e. the inner
       value shadows the outer one. This can catch typographical errors
       that turn into hard-to-find bugs, e.g., in the inadvertent capture
       of what would be a recursive call in
       ``f = ... let f = id in ... f ...``.

       The warning is suppressed for names beginning with an underscore.
       For example ::

	   f x = do { _ignore <- this; _ignore <- that; return (the other) }

.. ghc-flag:: -Wname-shadowing

    .. index::
       single: シャドウ, 〜警告

    このオプションを有効にすると，内側のスコープの値と同じ名前の値が外側のスコープにあるとき，
    すなわち，内側の名前が外側の名前を隠す(シャドウする)ときに警告を発行する．
    この警告によって，ミスタイプによる見つけにくいバグを捕捉できることがある．
    たとえば ``f = ... let f = id in ... f ...`` において，再帰呼び出しであるはずのものがそうなっていないことが捕捉されます．

    この警告は，以下のようにアンダースコアで始まる名前については発行されません． ::

        f x = do { _ignore <- this; _ignore <- that; return (the other) }

.. ghc-flag:: -Worphans

    .. index::
       single: orphan instances, warning
       single: orphan rules, warning

    These flags cause a warning to be emitted whenever the module
    contains an "orphan" instance declaration or rewrite rule. An
    instance declaration is an orphan if it appears in a module in which
    neither the class nor the type being instanced are declared in the
    same module. A rule is an orphan if it is a rule for a function
    declared in another module. A module containing any orphans is
    called an orphan module.

    The trouble with orphans is that GHC must pro-actively read the
    interface files for all orphan modules, just in case their instances
    or rules play a role, whether or not the module's interface would
    otherwise be of any use. See :ref:`orphan-modules` for details.

    The flag :ghc-flag:`-Worphans` warns about user-written orphan rules or
    instances.

.. ghc-flag:: -Woverlapping-patterns

    .. index::
       single: overlapping patterns, warning
       single: patterns, overlapping

    By default, the compiler will warn you if a set of patterns are
    overlapping, e.g., ::

        f :: String -> Int
        f []     = 0
        f (_:xs) = 1
        f "2"    = 2

    where the last pattern match in ``f`` won't ever be reached, as the
    second pattern overlaps it. More often than not, redundant patterns
    is a programmer mistake/error, so this option is enabled by default.

.. ghc-flag:: -Wsimplifiable-class-constraints

    :since: 8.2

    .. index::
       single: simplifiable class constraints, warning

    Warn about class constraints in a type signature that can be simplified
    using a top-level instance declaration.  For example: ::

       f :: Eq [a] => a -> a

    Here the ``Eq [a]`` in the signature overlaps with the top-level
    instance for ``Eq [a]``.  GHC goes to some efforts to use the former,
    but if it should use the latter, it would then have an
    insoluble ``Eq a`` constraint.  Best avoided by instead writing: ::

       f :: Eq a => a -> a

    This option is on by default. As usual you can suppress it on a
    per-module basis with :ghc-flag:`-Wno-simplifiable-class-constraints
    <-Wsimplifiable-class-constraints>`.

.. ghc-flag:: -Wtabs

    .. index::
       single: tabs, warning

    Have the compiler warn if there are tabs in your source file.

.. ghc-flag:: -Wtype-defaults

    .. index::
       single: defaulting mechanism, warning

    Have the compiler warn/inform you where in your source the Haskell
    defaulting mechanism for numeric types kicks in. This is useful
    information when converting code from a context that assumed one
    default into one with another, e.g., the ‘default default’ for
    Haskell 1.4 caused the otherwise unconstrained value ``1`` to be
    given the type ``Int``, whereas Haskell 98 and later defaults it to
    ``Integer``. This may lead to differences in performance and
    behaviour, hence the usefulness of being non-silent about this.

    This warning is off by default.

.. ghc-flag:: -Wmonomorphism-restriction

    .. index::
       single: monomorphism restriction, warning

    Have the compiler warn/inform you where in your source the Haskell
    Monomorphism Restriction is applied. If applied silently the MR can
    give rise to unexpected behaviour, so it can be helpful to have an
    explicit warning that it is being applied.

    This warning is off by default.

.. ghc-flag:: -Wunsupported-llvm-version

    Warn when using :ghc-flag:`-fllvm` with an unsupported version of LLVM.

.. ghc-flag:: -Wunticked-promoted-constructors

    .. index::
       single: promoted constructor, warning

    Warn if a promoted data constructor is used without a tick preceding
    its name.

    For example: ::

        data Nat = Succ Nat | Zero

        data Vec n s where
          Nil  :: Vec Zero a
          Cons :: a -> Vec n a -> Vec (Succ n) a

    Will raise two warnings because ``Zero`` and ``Succ`` are not
    written as ``'Zero`` and ``'Succ``.

    This warning is enabled by default in :ghc-flag:`-Wall` mode.

.. ghc-flag:: -Wunused-binds

    .. index::
       single: unused binds, warning
       single: binds, unused

    Report any function definitions (and local bindings) which are
    unused. An alias for

    -  :ghc-flag:`-Wunused-top-binds`
    -  :ghc-flag:`-Wunused-local-binds`
    -  :ghc-flag:`-Wunused-pattern-binds`

.. ghc-flag:: -Wunused-top-binds

    .. index::
       single: unused binds, warning
       single: binds, unused

    Report any function definitions which are unused.

    More precisely, warn if a binding brings into scope a variable that
    is not used, except if the variable's name starts with an
    underscore. The "starts-with-underscore" condition provides a way to
    selectively disable the warning.

    A variable is regarded as "used" if

    -  It is exported, or

    -  It appears in the right hand side of a binding that binds at
       least one used variable that is used

    For example: ::

        module A (f) where
        f = let (p,q) = rhs1 in t p  -- No warning: q is unused, but is locally bound
        t = rhs3                     -- No warning: f is used, and hence so is t
        g = h x                      -- Warning: g unused
        h = rhs2                     -- Warning: h is only used in the
                                     -- right-hand side of another unused binding
        _w = True                    -- No warning: _w starts with an underscore

.. ghc-flag:: -Wunused-local-binds

    .. index::
       single: unused binds, warning
       single: binds, unused

    Report any local definitions which are unused. For example: ::

        module A (f) where
        f = let (p,q) = rhs1 in t p  -- Warning: q is unused
        g = h x                      -- No warning: g is unused, but is a top-level binding

.. ghc-flag:: -Wunused-pattern-binds

    .. index::
       single: unused binds, warning
       single: binds, unused

    Warn if a pattern binding binds no variables at all, unless it is a
    lone, possibly-banged, wild-card pattern. For example: ::

        Just _ = rhs3    -- Warning: unused pattern binding
        (_, _) = rhs4    -- Warning: unused pattern binding
        _  = rhs3        -- No warning: lone wild-card pattern
        !_ = rhs4        -- No warning: banged wild-card pattern; behaves like seq

    The motivation for allowing lone wild-card patterns is they are not
    very different from ``_v = rhs3``, which elicits no warning; and
    they can be useful to add a type constraint, e.g. ``_ = x::Int``. A
    lone banged wild-card pattern is useful as an alternative (to
    ``seq``) way to force evaluation.

.. ghc-flag:: -Wunused-imports

    .. index::
       single: unused imports, warning
       single: imports, unused

    Report any modules that are explicitly imported but never used.
    However, the form ``import M()`` is never reported as an unused
    import, because it is a useful idiom for importing instance
    declarations, which are anonymous in Haskell.

.. ghc-flag:: -Wunused-matches

    .. index::
       single: unused matches, warning
       single: matches, unused

    Report all unused variables which arise from term-level pattern matches,
    including patterns consisting of a single variable. For instance
    ``f x y = []`` would report ``x`` and ``y`` as unused. The warning
    is suppressed if the variable name begins with an underscore, thus: ::

        f _x = True

    Note that :ghc-flag:`-Wunused-matches` does not warn about variables which
    arise from type-level patterns, as found in type family and data family
    instances. This must be enabled separately through the
    :ghc-flag:`-Wunused-type-patterns` flag.

.. ghc-flag:: -Wunused-do-bind

    .. index::
       single: unused do binding, warning
       single: do binding, unused

    Report expressions occurring in ``do`` and ``mdo`` blocks that
    appear to silently throw information away. For instance
    ``do { mapM popInt xs ; return 10 }`` would report the first
    statement in the ``do`` block as suspicious, as it has the type
    ``StackM [Int]`` and not ``StackM ()``, but that ``[Int]`` value is
    not bound to anything. The warning is suppressed by explicitly
    mentioning in the source code that your program is throwing
    something away: ::

        do { _ <- mapM popInt xs ; return 10 }

    Of course, in this particular situation you can do even better: ::

        do { mapM_ popInt xs ; return 10 }

.. ghc-flag:: -Wunused-type-patterns

    .. index::
       single: unused type patterns, warning
       single: type patterns, unused

    Report all unused type variables which arise from patterns in type family
    and data family instances. For instance: ::

        type instance F x y = []

    would report ``x`` and ``y`` as unused. The warning is suppressed if the
    type variable name begins with an underscore, like so: ::

        type instance F _x _y = []

    Unlike :ghc-flag:`-Wunused-matches`, :ghc-flag:`-Wunused-type-patterns` is
    not implied by :ghc-flag:`-Wall`. The rationale for this decision is that
    unlike term-level pattern names, type names are often chosen expressly for
    documentation purposes, so using underscores in type names can make the
    documentation harder to read.

.. ghc-flag:: -Wunused-foralls

    .. index::
       single: unused foralls, warning
       single: foralls, unused

    Report all unused type variables which arise from explicit, user-written
    ``forall`` statements. For instance: ::

        g :: forall a b c. (b -> b)

    would report ``a`` and ``c`` as unused.

.. ghc-flag:: -Wwrong-do-bind

    .. index::
       single: apparently erroneous do binding, warning
       single: do binding, apparently erroneous

    Report expressions occurring in ``do`` and ``mdo`` blocks that
    appear to lack a binding. For instance
    ``do { return (popInt 10) ; return 10 }`` would report the first
    statement in the ``do`` block as suspicious, as it has the type
    ``StackM (StackM Int)`` (which consists of two nested applications
    of the same monad constructor), but which is not then "unpacked" by
    binding the result. The warning is suppressed by explicitly
    mentioning in the source code that your program is throwing
    something away: ::

        do { _ <- return (popInt 10) ; return 10 }

    For almost all sensible programs this will indicate a bug, and you
    probably intended to write: ::

        do { popInt 10 ; return 10 }

.. ghc-flag:: -Winline-rule-shadowing

    Warn if a rewrite RULE might fail to fire because the function might
    be inlined before the rule has a chance to fire. See
    :ref:`rules-inline`.

.. ghc-flag:: -Wcpp-undef

    This flag passes ``-Wundef`` to the C pre-processor (if its being used)
    which causes the pre-processor to warn on uses of the `#if` directive on
    undefined identifiers.

.. ghc-flag:: -Wunbanged-strict-patterns

    This flag warns whenever you write a pattern that binds a variable whose
    type is unlifted, and yet the pattern is not a bang pattern nor a bare variable.
    See :ref:`glasgow-unboxed` for information about unlifted types.

.. ghc-flag:: -Wmissing-home-modules

    :since: 8.2

    When a module provided by the package currently being compiled
    (i.e. the "home" package) is imported, but not explicitly listed in
    command line as a target. Useful for Cabal to ensure GHC won't
    pick up modules, not listed neither in ``exposed-modules``, nor in
    ``other-modules``.

If you're feeling really paranoid, the :ghc-flag:`-dcore-lint` option is a good choice.
It turns on heavyweight intra-pass sanity-checking within GHC. (It checks GHC's
sanity, not yours.)

