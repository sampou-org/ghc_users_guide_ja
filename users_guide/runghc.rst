..
   .. _runghc:

   Using runghc
   ============

   .. index::
      single: runghc

   ``runghc`` allows you to run Haskell programs without first having to
   compile them.

.. _runghc:

runghc を使う
=============

.. index::
   single: runghc

``runghc`` を使えばHaskellのプログラムをコンパイルせずに実行できます．

..
   .. _runghc-introduction:

   Usage
   -----

.. _runghc-introduction:

使い方
------

..
   The ``runghc`` command-line looks like:

   ::

       runghc [runghc flags] [GHC flags] module [program args]

   Any flags not recognized by runghc are automatically passed to GHC.
   If a flag is recognized by both runghc and GHC but you want to
   pass it to GHC then you can place it after a ``--`` separator. Flags after the
   separator are treated as GHC only flags. Alternatively you can use the runghc
   option ``--ghc-arg=<arg>`` to pass any flag or argument directly to GHC.

``runghc`` のコマンドラインは以下のようになります．

::

    runghc [runghc flags] [GHC flags] module [program args]

runghcが認識しないフラグはすべて自動的にGHCへ渡します．
runghcもGHCも両方ともに認識するフラグでGHCに渡したいフラグであるなら ``--`` という区切り子の後に置きます．
この区切り子の後に置いたフラグはGHCのフラグとしてのみ扱われます．
他にもrunghcのオプション ``--ghc-arg=<arg>`` を使えばフラグや引数を直接GHCに渡せます．

..
   ``module`` could be a Haskell source filename with or without the extension.
   If for some reason the filename starts with a ``-`` you can use a second
   ``--`` to indicate the end of flags. Anything following a second
   ``--`` will be considered a program file or module name followed by its
   arguments. For example:

   - ``runghc -- -- -hello.hs``

``module`` はHaskellのソースファイル名で，拡張子を指定してもしなくてもかまいません．
もし何らかの理由でファイル名が ``-`` で始まっている場合は2つめの ``--`` を使ってフラグ列の終端を示せばよいでしょう．
2つめの ``--`` より後にある部分はファイルあるいはモジュール名とそれに続く引数と見なします．
たとえば，以下のようにできます．

- ``runghc -- -- -hello.hs``

..
   runghc flags
   ------------

   runghc accepts the following flags:

   - ``-f /path/to/ghc``: tell runghc the path of GHC executable to use to run the program. By default runghc will search for GHC in the directories in the system search path.
   - ``--ghc-arg=<arg>``: Pass an option or argument to GHC
   - ``--help``: print usage information.
   - ``--version``: print version information.

runghc フラグ
-------------

runghc は以下のフラグを受け付けます．

- ``-f /path/to/ghc``: runghcにプログラムを実行するGHC実行ファイルを教えます．デフォルトでは，runghc はシステムの検索パスを探します．
- ``--ghc-arg=<arg>``: GHCへオプションまたは引数を渡します．
- ``--help``: 使い方情報を表示します．
- ``--version``: バージョン情報を表示します．

..
   GHC Flags
   ---------

   As discussed earlier, use ``--`` or ``--ghc-arg=<arg>`` to disambiguate GHC
   flags when needed. For example, ``-f`` is recognized by runghc, therefore to
   pass ``-fliberate-case`` to GHC use any of the following:

   - ``runghc -- -fliberate-case``
   - ``runghc --ghc-arg=-fliberate-case``

   Note that any non-flag arguments are never passed to GHC. An unused non-flag
   argument will be considered as the name of the program to run. If a GHC flag
   takes an argument use ``--ghc-arg=<arg>`` to pass the argument to GHC.
   For example, if you want to pass ``-package foo`` to GHC use any of the
   following:

   - ``runghc -package --ghc-arg=foo Main.hs``
   - ``runghc --ghc-arg=-package --ghc-arg=foo Main.hs``

GHCフラグ
---------

前述のように ``--`` や ``--ghc-arg=<arg>`` を使えば GHC フラグが必要なときに曖昧にならないようにできます．
たとえば ``-f`` は runghc も認識するフラグですから ``-fliberate-case`` を GHC に渡すには以下のどちらかを使います．

- ``runghc -- -fliberate-case``
- ``runghc --ghc-arg=-fliberate-case``

フラグではない引数がGHCに渡ることはないということに注意してください．
使われないフラグではない引数は，実行すべきプログラムの名前として扱います．
GHCフラグが引数を取る場合 ``--ghc-arg=<arg>`` を使ってGHCにその引数を渡します．
たとえば ``-package foo`` を GHC に渡したいときには，以下のどちらかを使います．

- ``runghc -package --ghc-arg=foo Main.hs``
- ``runghc --ghc-arg=-package --ghc-arg=foo Main.hs``
