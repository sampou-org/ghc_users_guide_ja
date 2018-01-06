..
   .. _using-ghc:

   Using GHC
   =========

   .. index::
      single: GHC, using
      single: using GHC

.. _using-ghc:

GHCを使う
=========

.. index::
   single: GHC, 〜を使う
   single: GHCを使う

..
   Getting started: compiling programs
   -----------------------------------

   In this chapter you'll find a complete reference to the GHC command-line
   syntax, including all 400+ flags. It's a large and complex system, and
   there are lots of details, so it can be quite hard to figure out how to
   get started. With that in mind, this introductory section provides a
   quick introduction to the basic usage of GHC for compiling a Haskell
   program, before the following sections dive into the full syntax.

始めよう: プログラムをコンパイルする
------------------------------------

この章では，400を超えるフラグを含むGHCのコマンドライン構文の完全なリファレンスを示します．
GHCは大きく複雑なシステムで，大量の詳細がありますのですので，どう始めてよいのかが判りにくでしょう．
これを踏まえて，この節ではHaskellプログラムをコンパイルするためのGHCの基本的な使い方をざっと紹介します．
これを読んでから，以降の節での完全な構文の解説に飛び込むのがいいでしょう．

..
   Let's create a Hello World program, and compile and run it. First,
   create a file :file:`hello.hs` containing the Haskell code: ::

       main = putStrLn "Hello, World!"

   To compile the program, use GHC like this:

   .. code-block:: sh

       $ ghc hello.hs

   (where ``$`` represents the prompt: don't type it). GHC will compile the
   source file :file:`hello.hs`, producing an object file :file:`hello.o` and an
   interface file :file:`hello.hi`, and then it will link the object file to
   the libraries that come with GHC to produce an executable called
   :file:`hello` on Unix/Linux/Mac, or :file:`hello.exe` on Windows.

Hello World プログラムを作って，これをコンパイルして，走らせてみましょう．
まず，以下のHaskellコードを含む :file:`hello.hs` を作成しましょう．

    main = putStrLn "Hello, World!"

このプログラムをコンパイルするには以下のようにGHCを使います．

.. code-block:: sh

    $ ghc hello.hs

(ここで ``$`` はシェルのプロンプトですので，タイプする必要はありません．)
GHCはソースファイル :file:`hello.hs` をコンパイルして，オブジェクトファイル :file:`hello.o` と
インターフェイス :file:`hello.hi` を生成してから，オブジェクトをGHC付属のライブラリとリンクして，
Unix/Linux/Mac では :file:`hello` という実行可能ファイルを Windowsでは :file:`hello.exe` という実行ファイルを生成します．

..
   By default GHC will be very quiet about what it is doing, only printing
   error messages. If you want to see in more detail what's going on behind
   the scenes, add :ghc-flag:`-v` to the command line.

   Then we can run the program like this:

   .. code-block:: sh

       $ ./hello
       Hello World!

デフォルトではGHCは自身の動作について寡黙で，表示するのはエラーメッセージだけです．
裏で何が行われているか詳細をみたいときには，コマンドラインに :ghc-flag:`-v` を追加すれば良いでしょう．

コンパイルができたら，以下のようにすればプログラムを実行できます．

.. code-block:: sh

    $ ./hello
    Hello World!

..
   If your program contains multiple modules, then you only need to tell
   GHC the name of the source file containing the ``Main`` module, and GHC
   will examine the ``import`` declarations to find the other modules that
   make up the program and find their source files. This means that, with
   the exception of the ``Main`` module, every source file should be named
   after the module name that it contains (with dots replaced by directory
   separators). For example, the module ``Data.Person`` would be in the
   file ``Data/Person.hs`` on Unix/Linux/Mac, or ``Data\Person.hs`` on
   Windows.

プログラムが複数のモジュールから構成されている場合でも，単に ``Main`` モジュールのファイル名を指定するだけですみます．
GHCは ``Main`` モジュールの ``import`` 宣言を見て，プログラムを構成するその他のモジュールを見つけ，そのソースファイルを探します．
したがって ``Main`` モジュールを除くモジュールのソースファイルはモジュール名を反映していなければなりません
(ドットはディレクトリ区切り子に変換します)．
たとえば ``Data.Person`` モジュールは，Unix/Linux/Macでは ``Data/Person.hs`` というファイルに，
Windowsでは ``Data\Person.hs`` というファイルに置くことになります．

..
   Options overview
   ----------------

   GHC's behaviour is controlled by options, which for historical reasons
   are also sometimes referred to as command-line flags or arguments.
   Options can be specified in three ways:

オプションの概要
----------------

GHCの振る舞いはオプションによって制御します．
歴史的理由からオプションのことをコマンドラインフラグとかコマンドライン引数ともいいます．
オプションの指定方法は3つあります．

..
   Command-line arguments
   ~~~~~~~~~~~~~~~~~~~~~~

   .. index::
      single: structure, command-line
      single: command-line; arguments
      single: arguments; command-line

   An invocation of GHC takes the following form:

   .. code-block:: none

       ghc [argument...]

   Command-line arguments are either options or file names.

コマンドライン引数
~~~~~~~~~~~~~~~~~~

.. index::
   single: 構造, コマンドラインの〜
   single: コマンドライン; 〜引数
   single: 引数; コマンドライン〜

GHCを起動する構文は以下の形式になります．

.. code-block:: none

    ghc [argument...]

コマンドライン引数はオプションもしくはファイル名です．

..
   Command-line options begin with ``-``. They may *not* be grouped:
   ``-vO`` is different from ``-v -O``. Options need not precede filenames:
   e.g., ``ghc *.o -o foo``. All options are processed and then applied to
   all files; you cannot, for example, invoke
   ``ghc -c -O1 Foo.hs -O2 Bar.hs`` to apply different optimisation levels
   to the files ``Foo.hs`` and ``Bar.hs``.

コマンドラインオプションは ``-`` で始まります．
これをひとまとめにすることは**できません**．
``-vO`` と ``-v -O`` とは違うものであるということです．
オプションをファイル名より前で指定する必要はありません．
たとえば ``ghc *.o -o foo`` のようにできます．
すべてのオプションを処理してから，それらをすべてのファイルに適用します．
そのため ``ghc -c -O1 Foo.hs -O2 Bar.hs`` とやって ``Foo.hs`` と ``Bar.hs`` に異なる最適化水準を適用することはできません．

..
   .. note::

       .. index::
	  single: command-line; order of arguments

       Note that command-line options are *order-dependent*, with arguments being
       evaluated from left-to-right. This can have seemingly strange effects in the
       presence of flag implication. For instance, consider
       :ghc-flag:`-fno-specialise <-fspecialise>` and :ghc-flag:`-O1` (which implies
       :ghc-flag:`-fspecialise`). These two command lines mean very different
       things:

       ``-fno-specialise -O1``

	   ``-fspecialise`` will be enabled as the ``-fno-specialise`` is overriden
	   by the ``-O1``.

       ``-O1 -fno-specialise``

	   ``-fspecialise`` will not be enabled, since the ``-fno-specialise``
	   overrides the ``-fspecialise`` implied by ``-O1``.

.. note::

    .. index::
       single: コマンドライン; 〜における引数の順序

    コマンドラインオプションは *順序依存* であることに注意してください．引数は左から右へ評価されます．
    このことによって，フラグの連動がある場合おかしな効果があらわれことがあります．
    たとえば :ghc-flag:`-fno-specialise <-fspecialise>` と :ghc-flag:`-O1` (このフラグにより :ghc-flag:`-fspecialise` が有効になる) とを考えてみましょう．
    つぎの2つのコマンドラインは全く別ものです．

    ``-fno-specialise -O1``

        ``-fno-specialise`` に  ``-O1`` が上書きして ``-fspecialise`` が有効になります．

    ``-O1 -fno-specialise``

        ``-O1`` に連動する ``-fspecialise`` は ``-fno-specialise`` で上書きされてしまうので有効になりません．

..
   .. _source-file-options:

   Command line options in source files
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   .. index::
      single: source-file options

   Sometimes it is useful to make the connection between a source file and
   the command-line options it requires quite tight. For instance, if a
   Haskell source file deliberately uses name shadowing, it should be
   compiled with the ``-Wno-name-shadowing`` option. Rather than
   maintaining the list of per-file options in a ``Makefile``, it is
   possible to do this directly in the source file using the
   ``OPTIONS_GHC`` :ref:`pragma <options-pragma>` ::

       {-# OPTIONS_GHC -Wno-name-shadowing #-}
       module X where
       ...

   ``OPTIONS_GHC`` is a *file-header pragma* (see :ref:`options-pragma`).

.. _source-file-options:

ソースファイル中のコマンドラインオプション
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. index::
   single: ソースファイルオプション

ソースファイルとコマンドラインを強く結びつけた方が便利なことがあります．
たとえば，意図して名前のシャドーイングをおこなっているHaskellソースがあれば，
そのファイルについては ``-Wno-name-shadowing`` オプション付きでコンパイルすべきです．
``Makefile`` をつかって，ファイルごとのオプション一覧を管理する代りに，
``OPTIONS_GHC`` :ref:`pragma <options-pragma>` を使ってソースファイルに直接書いておけます． ::

    {-# OPTIONS_GHC -Wno-name-shadowing #-}
    module X where
    ...

``OPTIONS_GHC`` は *ファイルヘッダプラグマ* (:ref:`options-pragma` 参照)です．

..
   Only *dynamic* flags can be used in an ``OPTIONS_GHC`` pragma (see
   :ref:`static-dynamic-flags`).

   Note that your command shell does not get to the source file options,
   they are just included literally in the array of command-line arguments
   the compiler maintains internally, so you'll be desperately disappointed
   if you try to glob etc. inside ``OPTIONS_GHC``.

``OPTIONS_GHC`` プラグマ中で使えるのは *動的* フラグだけです(:ref:`static-dynamic-flags` 参照)．

コマンドシェルからこのソースオプションを取得するわけではなく，
コンパイラが内部的に保持しているコマンドライン引数配列に含めるだけであることに注意してください．
そのため ``OPTIONS_GHC`` の中でワイルドカードを使おうとすると残念なことになります．

..
   .. note::
      The contents of ``OPTIONS_GHC`` are appended to the command-line
      options, so options given in the source file override those given on the
      command-line.

.. note::
   ``OPTIONS_GHC`` の内容はコマンドラインオプションの後に連結するので，
   コマンドラインで与えられたオプションがソースファイルオプションで上書きされます．

..
   It is not recommended to move all the contents of your Makefiles into
   your source files, but in some circumstances, the ``OPTIONS_GHC`` pragma
   is the Right Thing. (If you use :ghc-flag:`-keep-hc-file` and have ``OPTION`` flags in
   your module, the ``OPTIONS_GHC`` will get put into the generated ``.hc`` file).

Makefile の内容をすべてソースファイルに移すのは推奨しませんが，
場合によっては ``OPTIONS_GHC`` プラグマを使うのが正しいやり方になります．
(:ghc-flag:`-keep-hc-file` を使っていて，モジュールに ``OPTION`` フラグがあるなら，
生成した ``.hc`` ファイルには ``OPTIONS_GHC`` が置かれます．)

..
   Setting options in GHCi
   ~~~~~~~~~~~~~~~~~~~~~~~

   Options may also be modified from within GHCi, using the :ghci-cmd:`:set`
   command.

GHCiからオプションを設定する
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

GHCi内から :ghci-cmd:`:set` コマンドを使ってオプションを変更することもできます．

..
   .. _static-dynamic-flags:

   Static, Dynamic, and Mode options
   ---------------------------------

   .. index::
      single: static; options
      single: dynamic; options
      single: mode; options

   Each of GHC's command line options is classified as static, dynamic or
   mode:

       For example, :ghc-flag:`--make` or :ghc-flag:`-E`. There may only be a single mode
       flag on the command line. The available modes are listed in
       :ref:`modes`.

       Most non-mode flags fall into this category. A dynamic flag may be
       used on the command line, in a ``OPTIONS_GHC`` pragma in a source
       file, or set using :ghci-cmd:`:set` in GHCi.

       A few flags are "static", which means they can only be used on the
       command-line, and remain in force over the entire GHC/GHCi run.

   The flag reference tables (:ref:`flag-reference`) lists the status of
   each flag.

.. _static-dynamic-flags:

静的オプション，動的オプション，モード指定オプション
----------------------------------------------------

.. index::
   single: 静的; 〜オプション
   single: 動的; 〜オプション
   single: モード指定; 〜オプション

GHCのコマンドラインオプションは，静的オプション，動的オプション，モード指定オプションのいずれかに分類されます．

    :ghc-flag:`--make` や :ghc-flag:`-E` はモード指定フラグです．モード指定フラグはコマンドラインで1つだけ指定できます．
    利用可能なモードの一覧は :ref:`modes` にあります．

    モード指定フラグではない大部分のフラグは動的フラグに分類されます．
    動的フラグは，コマンドライン，ソースファイルの ``OPTIONS_GHC`` プラグマ，
    GHCi内の :ghci-cmd:`:set` コマンドのいずれの方法でも設定できます．

    残りのすこしばかりのフラグが静的フラグに分類されます．これらのフラグはコマンドラインでのみ使用可能で，1回のGHC/GHCiの実行を通し有効です．

フラグの参照表は(:ref:`flag-reference`)にはそれぞれどのフラグがどれに分類されているかが判るようになっています．

..
   There are a few flags that are static except that they can also be used
   with GHCi's :ghci-cmd:`:set` command; these are listed as “static/\ ``:set``\ ”
   in the table.

静的でありながら，GHCiの :ghci-cmd:`:set` コマンドで設定できるフラグも少しながらあります．
これは参照表では「static/\ ``:set``\ 」と表記されています．

..
   .. _file-suffixes:

   Meaningful file suffixes
   ------------------------

   .. index::
      single: suffixes, file
      single: file suffixes for GHC

   File names with "meaningful" suffixes (e.g., ``.lhs`` or ``.o``) cause
   the "right thing" to happen to those files.

重要な意味のあるファイル接尾辞
------------------------------

.. index::
   single: 接尾辞, ファイルの〜
   single: GHC用のファイル接尾辞

「意味のある」接尾辞 (たとえば ``.lhs`` あるいは ``.o``)の付いたファイルは，それにしたがって「適切な」方法で処理されます．

..
   ``.hs``
       A Haskell module.

   ``.lhs``
       .. index::
	  single: lhs file extension

       A “literate Haskell” module.

   ``.hspp``
       A file created by the preprocessor.

   ``.hi``
       A Haskell interface file, probably compiler-generated.

   ``.hc``
       Intermediate C file produced by the Haskell compiler.

   ``.c``
       A C file not produced by the Haskell compiler.

   ``.ll``
       An llvm-intermediate-language source file, usually produced by the
       compiler.

   ``.bc``
       An llvm-intermediate-language bitcode file, usually produced by the
       compiler.

   ``.s``
       An assembly-language source file, usually produced by the compiler.

   ``.o``
       An object file, produced by an assembler.

   Files with other suffixes (or without suffixes) are passed straight to
   the linker.

``.hs``
    Haskellモジュール．

``.lhs``
    .. index::
       single: lhsというファイル拡張子

    「文芸的Haskell」モジュール．

``.hspp``
    プリプロセッサが生成したファイル．

``.hi``
    Haskellインターフェイスファイル，コンパイラが生成したものであることが多い．

``.hc``
    Haskellコンパイラが生成した中間のCファイル．

``.c``
    Haskellコンパイラが生成したCファイル以外のCファイル．

``.ll``
    中間言語llvmのソースファイル．通常コンパイラが生成する．

``.bc``
    中間言語llvmのビットコードファイル．通常コンパイラが生成する．

``.s``
    アセンブリ言語のソースファイル．通常コンパイラが生成する．

``.o``
    アセンブラが生成するオブジェクトファイル．

これ以外の接尾辞が付く(あるいは接尾辞の付かない)ファイルは直接リンカに渡されます．

..
   .. _modes:

   Modes of operation
   ------------------

   .. index::
      single: help options

   GHC's behaviour is firstly controlled by a mode flag. Only one of these
   flags may be given, but it does not necessarily need to be the first
   option on the command-line. For instance,

   .. code-block:: none

       $ ghc Main.hs --make -o my-application

.. _modes:

実行モード
----------

.. index::
   single: helpオプション

GHCの振る舞いはまずモード指定フラグで制御します．
モード指定フラグは1つしか与えられませんが，コマンドラインにおいて最初のオプションである必要はありません．
以下は指定例です．

.. code-block:: none

    $ ghc Main.hs --make -o my-application

..
   If no mode flag is present, then GHC will enter :ghc-flag:`--make` mode
   (:ref:`make-mode`) if there are any Haskell source files given on the
   command line, or else it will link the objects named on the command line
   to produce an executable.

モード指定フラグがない場合，コマンドラインでHaskellのソースファイルが指定されていれば :ghc-flag:`--make`
モード(:ref:`make-mode`)になり，そうでなければ，コマンドライン中で指定さたオブジェクトをリンクして実行可能ファイルを生成します．

..
   The available mode flags are:

   .. ghc-flag:: --interactive

       .. index::
	  single: interactive mode
	  single: GHCi

       Interactive mode, which is also available as :program:`ghci`. Interactive
       mode is described in more detail in :ref:`ghci`.

以下のモード指定フラグが利用可能です．

.. ghc-flag:: --interactive

    .. index::
       single: 対話モード
       single: GHCi

    対話モード． :program:`ghci` としても使えます．
    対話モードの詳しい説明は :ref:`ghci` を参照してください．

..
   .. ghc-flag:: --make

       .. index::
	  single: make mode; of GHC

       In this mode, GHC will build a multi-module Haskell program
       automatically, figuring out dependencies for itself. If you have a
       straightforward Haskell program, this is likely to be much easier,
       and faster, than using :command:`make`. Make mode is described in
       :ref:`make-mode`.

       This mode is the default if there are any Haskell source files
       mentioned on the command line, and in this case the :ghc-flag:`--make`
       option can be omitted.

.. ghc-flag:: --make

    .. index::
       single: makeモード; GHCの〜

    このモードではGHCは複数のモジュールからなるHaskellプログラムを依存性を解析しながら自動的にビルドします．
    単純なHaskellプログラムなら，これは :command:`make` を使うよりずっと簡単でしかも速くビルドできます．
    makeモードについては :ref:`make-mode` で解説しています．

    コマンドラインでHaskellのソースコードを指定した場合は，このモードがデフォルトになります．
    その場合 :ghc-flag:`--make` オプションは省略できます．

..
   .. ghc-flag:: -e ⟨expr⟩

       .. index::
	  single: eval mode; of GHC

       Expression-evaluation mode. This is very similar to interactive
       mode, except that there is a single expression to evaluate (⟨expr⟩)
       which is given on the command line. See :ref:`eval-mode` for more
       details.

.. ghc-flag:: -e ⟨expr⟩

    .. index::
       single: evalモード; GHCの〜

    式評価モード．対話モードとほぼ同じですが，
    評価する式(⟨expr⟩)は1つだけで，コマンドラインで与えます．
    詳細については :ref:`eval-mode` を参照してください．

..
   .. ghc-flag:: -E
		 -C
		 -S
		 -c

       This is the traditional batch-compiler mode, in which GHC can
       compile source files one at a time, or link objects together into an
       executable. See :ref:`options-order`.

.. ghc-flag:: -E
              -C
              -S
              -c

    これは伝統的なバッチ処理コンパイラモードです．GHCは1度に1つのソースファイルをコンパイルするか，
    オブジェクトファイルをリンクして1つの実行可能ファイルを生成します．
    :ref:`options-order` を参照してください．

..
   .. ghc-flag:: -M

       .. index::
	   single: dependency-generation mode; of GHC

       Dependency-generation mode. In this mode, GHC can be used to
       generate dependency information suitable for use in a ``Makefile``.
       See :ref:`makefile-dependencies`.

.. ghc-flag:: -M

    .. index::
        single: 依存性生成モード; GHCの〜

    依存性生成モード．このモードでは，GHCを使って ``Makefile`` ファイルで使うのに適した依存性情報を生成できます．
    :ref:`makefile-dependencies` を参照してください．

..
   .. ghc-flag:: --frontend ⟨module⟩

       .. index::
	   single: frontend plugins; using

       Run GHC using the given frontend plugin. See :ref:`frontend_plugins` for
       details.

.. ghc-flag:: --frontend ⟨module⟩

    .. index::
        single: フロントエンドプラグイン; 〜を使う

    指定したフロントエンドプラグインを使ってGHCを走らせます．詳細は :ref:`frontend_plugins` を参照してください．

..
   .. ghc-flag:: --mk-dll

       .. index::
	  single: DLL-creation mode

       DLL-creation mode (Windows only). See :ref:`win32-dlls-create`.

.. ghc-flag:: --mk-dll

    .. index::
       single: DLL作成モード

    DLL作成モード(Windows のみ)． :ref:`win32-dlls-create` を参照してください．

..
   .. ghc-flag:: --help
		 -?

       Cause GHC to spew a long usage message to standard output and then
       exit.

.. ghc-flag:: --help
              -?

    GHC は使い方に関する長いメッセージを標準出力に吐いて，終了します．

..
   .. ghc-flag:: --show-iface ⟨file⟩

       Read the interface in ⟨file⟩ and dump it as text to ``stdout``. For
       example ``ghc --show-iface M.hi``.

.. ghc-flag:: --show-iface ⟨file⟩

    ⟨file⟩ 中のインターフェイスを読んで，それをテキストとして ``stdout`` にダンプします．
    たとえば ``ghc --show-iface M.hi`` のように使います．

..
   .. ghc-flag:: --supported-extensions
		 --supported-languages

       Print the supported language extensions.

.. ghc-flag:: --supported-extensions
              --supported-languages

    サポートしている言語拡張を表示します．

..
   .. ghc-flag:: --show-options

       Print the supported command line options. This flag can be used for
       autocompletion in a shell.

.. ghc-flag:: --show-options

    サポートしているコマンドラインオプションを表示します．シェルでの自動補完のために使えます．

..
   .. ghc-flag:: --info

       Print information about the compiler.

.. ghc-flag:: --info

    コンパイラに関する情報を表示します．

..
   .. ghc-flag:: --version
		 -V

       Print a one-line string including GHC's version number.

.. ghc-flag:: --version
              -V

    GHCのバージョン番号を含む1行の文字列を表示します．

..
   .. ghc-flag:: --numeric-version

       Print GHC's numeric version number only.

.. ghc-flag:: --numeric-version

    GHCのバージョンを数値でのみ表示します．

..
   .. ghc-flag:: --print-libdir

       .. index::
	  single: libdir

       Print the path to GHC's library directory. This is the top of the
       directory tree containing GHC's libraries, interfaces, and include
       files (usually something like ``/usr/local/lib/ghc-5.04`` on Unix).
       This is the value of ``$libdir`` in the package
       configuration file (see :ref:`packages`).

.. ghc-flag:: --print-libdir

    .. index::
       single: libdir

    GHCライブラリディレクトリのパスを表示します．
    このパスはGHCのライブラリ，インターフェイス，インクルードファイルが置かれているディレクトリツリーの最上位です
    (通常 Unix では ``/usr/local/lib/ghc-8.0.2`` のような場所です)．
    これはパッケージの設定ファイル(:ref:`packages` 参照)における ``$libdir`` の値です．
       
..
   .. _make-mode:

   Using ``ghc`` ``--make``
   ~~~~~~~~~~~~~~~~~~~~~~~~

   .. index::
      single: --make; mode of GHC
      single: separate compilation

   In this mode, GHC will build a multi-module Haskell program by following
   dependencies from one or more root modules (usually just ``Main``). For
   example, if your ``Main`` module is in a file called :file:`Main.hs`, you
   could compile and link the program like this:

   .. code-block:: none

       ghc --make Main.hs

.. _make-mode:

``ghc`` ``--make`` を使う
~~~~~~~~~~~~~~~~~~~~~~~~~

.. index::
   single: --make; GHCの〜モード
   single: 分割コンパイル

このモードではGHCは複数のモジュールからなるHaskellプログラムをビルドします．
このとき，GHCは1つ以上のルートモジュール(通常は ``Main`` のみ)から依存性を追跡します．
たとえば ``Main`` モジュールが :file:`Main.hs` というファイルに置かれているとき，
次のようにすればこのプログラムをコンパイルリンクできます．

.. code-block:: none

    ghc --make Main.hs

..
   In fact, GHC enters make mode automatically if there are any Haskell
   source files on the command line and no other mode is specified, so in
   this case we could just type

   .. code-block:: none

       ghc Main.hs

   Any number of source file names or module names may be specified; GHC
   will figure out all the modules in the program by following the imports
   from these initial modules. It will then attempt to compile each module
   which is out of date, and finally, if there is a ``Main`` module, the
   program will also be linked into an executable.

実際には，コマンドライン中に1つでもHaskellソースファイルがあり，他のモードが指定されていなければ，GHCは自動的にmakeモードになります．
したがって，これ例では以下のようにタイプするだけでよいのです．

.. code-block:: none

    ghc Main.hs

ソースファイル名やモジュール名はいくつでも指定できます．
GHCは，指定されたこれらの初期ファイルからインポートを追いかけて，プログラムに含まれるすべてのモジュールを見つけだします．
次に，最新ではないモジュールの再コンパイルを試み，最後に ``Main`` モジュールがあれば，プログラムをリンクして実行可能形式にします．

..
   The main advantages to using ``ghc --make`` over traditional
   ``Makefile``\s are:

   -  GHC doesn't have to be restarted for each compilation, which means it
      can cache information between compilations. Compiling a multi-module
      program with ``ghc --make`` can be up to twice as fast as running
      ``ghc`` individually on each source file.

   -  You don't have to write a ``Makefile``.

      .. index::
	 single: Makefiles; avoiding

   -  GHC re-calculates the dependencies each time it is invoked, so the
      dependencies never get out of sync with the source.

   -  Using the :ghc-flag:`-j[⟨n⟩]` flag, you can compile modules in parallel.
      Specify ``-j ⟨n⟩`` to compile ⟨n⟩ jobs in parallel. If ⟨n⟩ is omitted, then
      it defaults to the number of processors.

伝統的な ``Makefile`` に対して ``ghc --make`` を使う利点は，以下のようなことです．

-  コンパイルごとにGHCを再起動する必要がないので，それぞれのコンパイル間で情報をキャッシュできます．
   複数のモジュールからなるプログラムを ``ghc --make`` でコンパイルする方が，
   個々のソースファイルを1つずつコンパイルするより2倍も速くなることがあります．

-  ``Makefile`` を書かなくて済みます．

   .. index::
      single: Makefile; 〜の回避

-  GHCは起動されるごとに依存関係を再計算するので，
   ソースとの整合性が失われることはありません．

-  :ghc-flag:`-j[⟨n⟩]` フラグを使えば，モジュールを並列にコンパイルできます．
   ``-j ⟨n⟩`` と指定すれば ⟨n⟩ 個のジョブが並列に走ります．⟨n⟩ を省略した場合は，デフォルトではプロセッサの数になります．

..
   Any of the command-line options described in the rest of this chapter
   can be used with ``--make``, but note that any options you give on the
   command line will apply to all the source files compiled, so if you want
   any options to apply to a single source file only, you'll need to use an
   ``OPTIONS_GHC`` pragma (see :ref:`source-file-options`).

この章でこれ以降に解説するコマンドラインオプションはどれも ``--make`` オプションと共用できます．
ただし，コマンドラインから与えれらたオプションはコンパイルするすべてのソースファイルに適用されるので，
個別のファイルにだけ適用したいオプションについては ``OPTIONS_GHC`` プラグマを使う必要があります(:ref:`source-file-options` 参照)．

..
   If the program needs to be linked with additional objects (say, some
   auxiliary C code), then the object files can be given on the command
   line and GHC will include them when linking the executable.

プログラムを追加のオブジェクト(たとえば，補助的なCのコード)とリンクする必要があるなら，
そのオブジェクトファイルをコマンド行で与えれば，GHCは実行可能ファイルをリンクするときに指定されたオブジェクトを含めます．

..
   For backward compatibility with existing make scripts, when used in
   combination with :ghc-flag:`-c`, the linking phase is omitted (same as
   ``--make -no-link``).

既存の make スクリプトとの後方互換性確保のため :ghc-flag:`-c` と組み合わせて使うと，リンクのフェーズは省略します
(``--make -no-link`` を指定したのと同じ)．

..
   Note that GHC can only follow dependencies if it has the source file
   available, so if your program includes a module for which there is no
   source file, even if you have an object and an interface file for the
   module, then GHC will complain. The exception to this rule is for
   package modules, which may or may not have source files.

GHC はソースファイルがあるときにしか依存性を追跡できないので，
ソースファイルのないモジュールがプログラムに含まれていると，
たとえそのモジュールのオブジェクトファイルとインターフェイスファイルがあっても，
GHCは文句をいうことに注意してください．
ただし，パッケージモジュールの場合は例外で，このときはソースファイルはあってもなくてもかまいません．

..
   The source files for the program don't all need to be in the same
   directory; the :ghc-flag:`-i` option can be used to add directories to the
   search path (see :ref:`search-path`).

   .. ghc-flag:: -j[⟨n⟩]

       Perform compilation in parallel when possible. GHC will use up to ⟨N⟩
       threads during compilation. If N is omitted, then it defaults to the
       number of processors. Note that compilation of a module may not begin
       until its dependencies have been built.

プログラムのソースファイルはすべて同一のディレクトリにある必要はありません．
:ghc-flag:`-i` オプションを使って探索パスを追加できます(:ref:`search-path` 参照)．

.. ghc-flag:: -j [⟨n⟩]

    可能であればコンパイルを並列で行います．GHC はコンパイル中に ⟨n⟩ 個までのスレッドを使います．
    ⟨n⟩ の指定が省略されたばあいは，デフォルト値はプロセッサ数です．
    モジュールのコンパイルは，それが依存しているモジュールのコンパイルが済んでから開始するということに注意してください．

..
   .. _eval-mode:

   Expression evaluation mode
   ~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _eval-mode:

式評価モード
~~~~~~~~~~~~

..
   This mode is very similar to interactive mode, except that there is a
   single expression to evaluate which is specified on the command line as
   an argument to the ``-e`` option:

   .. code-block:: none

       ghc -e expr

..
   Haskell source files may be named on the command line, and they will be
   loaded exactly as in interactive mode. The expression is evaluated in
   the context of the loaded modules.

   For example, to load and run a Haskell program containing a module
   ``Main``, we might say:

   .. code-block:: none

       ghc -e Main.main Main.hs

   or we can just use this mode to evaluate expressions in the context of
   the ``Prelude``:

   .. code-block:: none

       $ ghc -e "interact (unlines.map reverse.lines)"
       hello
       olleh

コマンドラインで Haskell のソースファイルを指定することもできます．
指定したファイルは対話モードと全く同じようにロードします．
指定した式はロードしたモジュールの文脈で評価します．

たとえば ``Main`` というモジュールを含む Haskell プログラムをロードして走らせるには，次のようにすればよいでしょう．

.. code-block:: none

    ghc -e Main.main Main.hs

また，このモードを使えば，単に式を ``Prelude`` の文脈で評価できます．

.. code-block:: none

    $ ghc -e "interact (unlines.map reverse.lines)"
    hello
    olleh

..
   .. _options-order:

   Batch compiler mode
   ~~~~~~~~~~~~~~~~~~~

   In *batch mode*, GHC will compile one or more source files given on the
   command line.

.. _options-order:

一括コンパイラモード
~~~~~~~~~~~~~~~~~~~~

*一括処理モード* で GHC はコマンドラインで指定した1つ以上のソースファイルをコンパイルします．

..
   The first phase to run is determined by each input-file suffix, and the
   last phase is determined by a flag. If no relevant flag is present, then
   go all the way through to linking. This table summarises:

   +-----------------------------------+------------------------------+----------------------------+---------------------------+
   | Phase of the compilation system   | Suffix saying “start here”   | Flag saying “stop after”   | (suffix of) output file   |
   +===================================+==============================+============================+===========================+
   | literate pre-processor            | ``.lhs``                     |                            | ``.hs``                   |
   +-----------------------------------+------------------------------+----------------------------+---------------------------+
   | C pre-processor (opt.)            | ``.hs`` (with ``-cpp``)      | ``-E``                     | ``.hspp``                 |
   +-----------------------------------+------------------------------+----------------------------+---------------------------+
   | Haskell compiler                  | ``.hs``                      | ``-C``, ``-S``             | ``.hc``, ``.s``           |
   +-----------------------------------+------------------------------+----------------------------+---------------------------+
   | C compiler (opt.)                 | ``.hc`` or ``.c``            | ``-S``                     | ``.s``                    |
   +-----------------------------------+------------------------------+----------------------------+---------------------------+
   | assembler                         | ``.s``                       | ``-c``                     | ``.o``                    |
   +-----------------------------------+------------------------------+----------------------------+---------------------------+
   | linker                            | ⟨other⟩                      |                            | ``a.out``                 |
   +-----------------------------------+------------------------------+----------------------------+---------------------------+

複数ある段階のどこから始めるかは，それぞれのファイルの接尾辞によって決まります．
どこで終るかはフラグで指定します．
特にフラグによる指定がなければ，リンクまでの全ての段階を実行します．
以下の表にまとめておきます．

+-----------------------------------+------------------------------+----------------------------+---------------------------+
| コンパイルシステムの段階          | 「ここから開始」の接尾辞     | 「ここで終了」のフラグ     | 出力ファイルの接尾辞      |
+===================================+==============================+============================+===========================+
| 文芸形式プリプロセッサ            | ``.lhs``                     |                            | ``.hs``                   |
+-----------------------------------+------------------------------+----------------------------+---------------------------+
| C プリプロセッサ(省略可)          | ``.hs`` (``-cpp`` を使う)    | ``-E``                     | ``.hspp``                 |
+-----------------------------------+------------------------------+----------------------------+---------------------------+
| Haskell コンパイラ                | ``.hs``                      | ``-C``, ``-S``             | ``.hc``, ``.s``           |
+-----------------------------------+------------------------------+----------------------------+---------------------------+
| C コンパイラ(省略可)              | ``.hc`` or ``.c``            | ``-S``                     | ``.s``                    |
+-----------------------------------+------------------------------+----------------------------+---------------------------+
| アセンブラ                        | ``.s``                       | ``-c``                     | ``.o``                    |
+-----------------------------------+------------------------------+----------------------------+---------------------------+
| リンカ                            | ⟨other⟩                      |                            | ``a.out``                 |
+-----------------------------------+------------------------------+----------------------------+---------------------------+

..
   .. index::
      single: -C
      single: -E
      single: -S
      single: -c

   Thus, a common invocation would be:

   .. code-block:: none

       ghc -c Foo.hs

   to compile the Haskell source file ``Foo.hs`` to an object file
   ``Foo.o``.

.. index::
   single: -C
   single: -E
   single: -S
   single: -c

そういうわけで，多くの場合，次のように起動します．

.. code-block:: none

    ghc -c Foo.hs

これで，Haskellのソースファイルが ``Foo.hs`` をコンパイルすると，オブジェクトファイル ``Foo.o`` が生成されます．

..
   .. note::
      What the Haskell compiler proper produces depends on what backend
      code generator is used. See :ref:`code-generators` for more details.

.. note::
   Haskellのコンパイラが実際に出力するのが何かはバックエンドのコード生成器が何であるかによります．
   詳細については :ref:`code-generators` を参照してください．

..
   .. note::
      Pre-processing is optional, the :ghc-flag:`-cpp` flag turns it
      on. See :ref:`c-pre-processor` for more details.

.. note::
   C のプリプロセッサは省略可能で :ghc-flag:`-cpp` フラグを指定すれば有効になります．
   詳細については :ref:`c-pre-processor` を参照してください．

..
   .. note::
      The option :ghc-flag:`-E` runs just the pre-processing passes of
      the compiler, dumping the result in a file.

.. note::
   :ghc-flag:`-E` オプションを指定するとコンパイラのプリプロセス段階だけが実行され結果がファイルに出力されます．

..
   .. note::
      The option :ghc-flag:`-C` is only available when GHC is built in
      unregisterised mode. See :ref:`unreg` for more details.

.. note::
   :ghc-flag:`-C` オプションはGHCが未登録モードでビルドされているときにだけ利用可能です．
   詳細については :ref:`unreg` を参照してください．

..
   .. _overriding-suffixes:

   Overriding the default behaviour for a file
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   As described above, the way in which a file is processed by GHC depends on its
   suffix. This behaviour can be overridden using the :ghc-flag:`-x ⟨suffix⟩`
   option:

   .. ghc-flag:: -x ⟨suffix⟩

       Causes all files following this option on the command line to be
       processed as if they had the suffix ⟨suffix⟩. For example, to
       compile a Haskell module in the file ``M.my-hs``, use
       ``ghc -c -x hs M.my-hs``.

.. _overriding-suffixes:

ファイルに対するデフォルトの振る舞いを上書きする
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

上述のように，GHCがファイルを処理する方法はファイルの接頭辞で決まります．
この振る舞いは :ghc-flag:`-x ⟨suffix⟩` オプションで変更できます．

.. ghc-flag:: -x ⟨suffix⟩

    コマンドラインにおいて，このオプションに続くすべてのファイルに指定した接尾辞 ⟨suffix⟩ が付いているものとして扱います．
    たとえば ``M.my-hs`` というファイルにある Haskell モジュールをコンパイルするには ``ghc -c -x hs M.my-hs`` とします．

..
   .. _options-help:

   Verbosity options
   -----------------

   .. index::
      single: verbosity options

   See also the ``--help``, ``--version``, ``--numeric-version``, and
   ``--print-libdir`` modes in :ref:`modes`.

.. _options-help:

饒舌性に関するオプション
------------------------

.. index::
   single: 饒舌性オプション

:ref:`modes` にある ``--help`` ， ``--version`` ， ``--numeric-version`` ， ``--print-libdir`` の各モードについても参照してください．

..
   .. ghc-flag:: -v

       The :ghc-flag:`-v` option makes GHC *verbose*: it reports its version number
       and shows (on stderr) exactly how it invokes each phase of the
       compilation system. Moreover, it passes the ``-v`` flag to most
       phases; each reports its version number (and possibly some other
       information).

       Please, oh please, use the ``-v`` option when reporting bugs!
       Knowing that you ran the right bits in the right order is always the
       first thing we want to verify.

.. ghc-flag:: -v

    :ghc-flag:`-v` オプションにより GHC は *饒舌* になります．
    GHCはバージョン番号を報告し，コンパイルシステムの各段階ごとに，どのように起動したかを(標準エラー出力に)表示します．
    さらに，ほととんどの段階に ``-v`` フラグを渡し，それぞれがバージョン番号(やそれ以外の情報)を報告します．

    バグ報告するときは，お願いですから ``-v`` を使ってください．
    正しいことが正しい順序でおこなわれていることを先ず確認したいからです．

..
   .. ghc-flag:: -v ⟨n⟩
       :noindex:

       To provide more control over the compiler's verbosity, the ``-v``
       flag takes an optional numeric argument. Specifying ``-v`` on its
       own is equivalent to ``-v3``, and the other levels have the
       following meanings:

       ``-v0``
	   Disable all non-essential messages (this is the default).

       ``-v1``
	   Minimal verbosity: print one line per compilation (this is the
	   default when :ghc-flag:`--make` or :ghc-flag:`--interactive` is on).

       ``-v2``
	   Print the name of each compilation phase as it is executed.
	   (equivalent to :ghc-flag:`-dshow-passes`).

       ``-v3``
	   The same as ``-v2``, except that in addition the full command
	   line (if appropriate) for each compilation phase is also
	   printed.

       ``-v4``
	   The same as ``-v3`` except that the intermediate program
	   representation after each compilation phase is also printed
	   (excluding preprocessed and C/assembly files).

.. ghc-flag:: -v ⟨n⟩
    :noindex:

    より細かく饒舌性を制御するために ``-v`` は省略可能は数値引数を与えられるようになっています．
    ``-v`` を単独で指定するのは ``-v3`` を指定するのと同じです．その他のレベルには以下のものがあります．
    

    ``-v0``
        本質的ではない全てのメッセージを無効にします(これがデフォルト)．

    ``-v1``
        最小限の饒舌性．コンパイルごとに1行表示します(:ghc-flag:`--make` あるいは :ghc-flag:`--interactive` が指定されたときはこれがデフォルト)．

    ``-v2``
        各コンパイル段階を実行するときに，その段階の名前が表示されます(:ghc-flag:`-dshow-passes` を指定したのと同じ)．

    ``-v3``
        各コンパイル段階について完全なコマンドライン(あれば)を表示します．それ以外は ``-v2`` と同じです．

    ``-v4``
        各コンパイル段階が終った後に (プリプロセッサの結果およびC/アセンブリファイルを除く) その段階での中間形式でプログラムを表示します．

..
   .. ghc-flag:: -fprint-potential-instances

       When GHC can't find an instance for a class, it displays a short
       list of some in the instances it knows about. With this flag it
       prints *all* the instances it knows about.

.. ghc-flag:: -fprint-potential-instances

    GHC はクラスのインスタンスを見つけられなかったら，判っているインスタンスのうちいくつかを並べて表示します．
    このフラグが指定されているときには，判っているインスタンスを *すべて* 表示します．

..
   .. ghc-flag:: -fhide-source-paths

       Starting with minimal verbosity (``-v1``, see :ghc-flag:`-v`), GHC
       displays the name, the source path and the target path of each compiled
       module. This flag can be used to reduce GHC's output by hiding source paths
       and target paths.

.. ghc-flag:: -fhide-source-paths

    最小の冗長性(``-v1``, see :ghc-flag:`-v`)以降を指定すると，
    GHCは各コンパイルされたモジュールの名前，ソースパス，およびターゲットパスを表示します．
    このフラグを使うとソースパスとターゲットパスを隠され表示を減らせます．

..
   The following flags control the way in which GHC displays types in error
   messages and in GHCi:

   .. ghc-flag:: -fprint-unicode-syntax

       When enabled GHC prints type signatures using the unicode symbols from the
       :ghc-flag:`-XUnicodeSyntax` extension. For instance,

       .. code-block:: none

	   ghci> :set -fprint-unicode-syntax
	   ghci> :t +v (>>)
	   (>>) ∷ Monad m ⇒ ∀ a b. m a → m b → m b

以下のフラグはGHCのエラーメッセージとGHCiとにおける型情報の表示方法を制御するものです．

.. ghc-flag:: -fprint-unicode-syntax

    このフラグが有効になっていれば，GHC は型シグネチャを言語拡張 :ghc-flag:`-XUnicodeSyntax` 由来のユニコード記号を使って表示します．
    たとえば，以下のような表示になります．
    
    .. code-block:: none

        ghci> :set -fprint-unicode-syntax
        ghci> :t +v (>>)
        (>>) :: Monad m ⇒ m a → m b → m b

..
   .. _pretty-printing-types:

   .. ghc-flag:: -fprint-explicit-foralls

       Using :ghc-flag:`-fprint-explicit-foralls` makes
       GHC print explicit ``forall`` quantification at the top level of a
       type; normally this is suppressed. For example, in GHCi:

       .. code-block:: none

	   ghci> let f x = x
	   ghci> :t f
	   f :: a -> a
	   ghci> :set -fprint-explicit-foralls
	   ghci> :t f
	   f :: forall a. a -> a

       However, regardless of the flag setting, the quantifiers are printed
       under these circumstances:

       -  For nested ``foralls``, e.g.

	  .. code-block:: none

	      ghci> :t GHC.ST.runST
	      GHC.ST.runST :: (forall s. GHC.ST.ST s a) -> a

       -  If any of the quantified type variables has a kind that mentions
	  a kind variable, e.g.

	  .. code-block:: none

	      ghci> :i Data.Type.Equality.sym
	      Data.Type.Equality.sym ::
		forall (k :: BOX) (a :: k) (b :: k).
		(a Data.Type.Equality.:~: b) -> b Data.Type.Equality.:~: a
		      -- Defined in Data.Type.Equality

.. _pretty-printing-types:
    
.. ghc-flag:: -fprint-explicit-foralls

    :ghc-flag:`-fprint-explicit-foralls` を指定すると
    GHC は型のトップレベルに，通常は表示されない ``forall`` 量化子を表示します．
    GHCi では，たとえば，以下のようになります．

    .. code-block:: none

        ghci> let f x = x
        ghci> :t f
        f :: a -> a
        ghci> :set -fprint-explicit-foralls
        ghci> :t f
        f :: forall a. a -> a

    ただし，このフラグの設定いかんにかかわらず，以下の場合には量化子が表示されます．

    -  入れ子になった ``forall`` 

       .. code-block:: none

           ghci> :t GHC.ST.runST
           GHC.ST.runST :: (forall s. GHC.ST.ST s a) -> a

    -  量化子付きの型変数のどれかがカインド変数で言及されているカインドをもつ

       .. code-block:: none

           ghci> :i Data.Type.Equality.sym
           Data.Type.Equality.sym ::
             forall (k :: BOX) (a :: k) (b :: k).
             (a Data.Type.Equality.:~: b) -> b Data.Type.Equality.:~: a
                   -- Defined in Data.Type.Equality

..
   .. ghc-flag:: -fprint-explicit-kinds

       Using :ghc-flag:`-fprint-explicit-kinds` makes GHC print kind arguments in
       types, which are normally suppressed. This can be important when you
       are using kind polymorphism. For example:

       .. code-block:: none

	   ghci> :set -XPolyKinds
	   ghci> data T a = MkT
	   ghci> :t MkT
	   MkT :: forall (k :: BOX) (a :: k). T a
	   ghci> :set -fprint-explicit-foralls
	   ghci> :t MkT
	   MkT :: forall (k :: BOX) (a :: k). T k a

.. ghc-flag:: -fprint-explicit-kinds

    :ghc-flag:`-fprint-explicit-kinds` を指定すると，通常は表示されないカインドが型に表示されます．
    カインド多相を使っているときには重要な機能です．

    .. code-block:: none

        ghci> :set -XPolyKinds
        ghci> data T a = MkT
        ghci> :t MkT
        MkT :: forall (k :: BOX) (a :: k). T a
        ghci> :set -fprint-explicit-foralls
        ghci> :t MkT
        MkT :: forall (k :: BOX) (a :: k). T k a

..
   .. ghc-flag:: -fprint-explicit-runtime-reps

       When :ghc-flag:`-fprint-explicit-runtime-reps` is enabled, GHC prints
       ``RuntimeRep`` type variables for levity-polymorphic types.
       Otherwise GHC will default these to ``PtrRepLifted``. For example,

       .. code-block:: none

	   ghci> :t ($)
	   ($) :: (a -> b) -> a -> b
	   ghci> :set -fprint-explicit-runtime-reps
	   ghci> :t ($)
	   ($)
	     :: forall (r :: GHC.Types.RuntimeRep) a (b :: TYPE r).
		(a -> b) -> a -> b

.. ghc-flag:: -fprint-explicit-runtime-reps

    :ghc-flag:`-fprint-explicit-runtime-reps` が有効になっていると，
    GHC はレヴィティ多相型について ``RuntimeRep`` 型変数を表示します．
    このフラグが有効になっていなければデフォルトでは ``PtrRepLifted`` になります．
    以下はその表示例です．

    .. code-block:: none

        ghci> :t ($)
        ($) :: (a -> b) -> a -> b
        ghci> :set -fprint-explicit-runtime-reps
        ghci> :t ($)
        ($)
          :: forall (r :: GHC.Types.RuntimeRep) a (b :: TYPE r).
             (a -> b) -> a -> b

..
   .. ghc-flag:: -fprint-explicit-coercions

       Using :ghc-flag:`-fprint-explicit-coercions` makes GHC print coercions in
       types. When trying to prove the equality between types of different
       kinds, GHC uses type-level coercions. Users will rarely need to
       see these, as they are meant to be internal.

.. ghc-flag:: -fprint-explicit-coercions

    :ghc-flag:`-fprint-explicit-coercions` を指定すると GHC は型の変換を表示します．
    異なるカインドの型間の相等性を証明しようとすると，GHC は型レベルの変換を使います．
    ユーザがこれ見なければならなくなるのは稀です．あくまでもコンパイラ内部のできごとだからです．

..
   .. ghc-flag:: -fprint-equality-relations

       Using :ghc-flag:`-fprint-equality-relations` tells GHC to distinguish between
       its equality relations when printing. For example, ``~`` is homogeneous
       lifted equality (the kinds of its arguments are the same) while
       ``~~`` is heterogeneous lifted equality (the kinds of its arguments
       might be different) and ``~#`` is heterogeneous unlifted equality,
       the internal equality relation used in GHC's solver. Generally,
       users should not need to worry about the subtleties here; ``~`` is
       probably what you want. Without :ghc-flag:`-fprint-equality-relations`, GHC
       prints all of these as ``~``. See also :ref:`equality-constraints`.

.. ghc-flag:: -fprint-equality-relations

    :ghc-flag:`-fprint-equality-relations` を使って GHC に表示の際に相等性の関係を識別するよう指示できます．
    たとえば ``~`` 均質な持ち上げ(2つの引数は同じカインドをもつ)相等性関係であり，
    ``~~`` は異質な持ち上げ(2つの引数の型が異なる)相等性関係であり，
    ``~#`` は異質な持ち上げていないGHC内部のソルバで使われる相等性関係です．
    一般にユーザはこの微妙な部分について気を配る必要があるべきではなく， ``~`` が
    ユーザが欲っしているものでしょう．
    :ghc-flag:`-fprint-equality-relations` が指定されていなければ，GHCはすべて ``~`` として表示します．
    :ref:`equality-constraints` も参照してください．

..
   .. ghc-flag:: -fprint-expanded-synonyms

       When enabled, GHC also prints type-synonym-expanded types in type
       errors. For example, with this type synonyms: ::

	   type Foo = Int
	   type Bar = Bool
	   type MyBarST s = ST s Bar

       This error message:

       .. code-block:: none

	   Couldn't match type 'Int' with 'Bool'
	   Expected type: ST s Foo
	     Actual type: MyBarST s

       Becomes this:

       .. code-block:: none

	   Couldn't match type 'Int' with 'Bool'
	   Expected type: ST s Foo
	     Actual type: MyBarST s
	   Type synonyms expanded:
	   Expected type: ST s Int
	     Actual type: ST s Bool

.. ghc-flag:: -fprint-expanded-synonyms

    これが有効になっていれば，GHC は型エラーメッセージで型シノニムを展開した型も表示します．
    たとえば，以下のような型シノニムがあったとしましょう． ::

        type Foo = Int
        type Bar = Bool
        type MyBarST s = ST s Bar

    以下のような型エラーメッセージ

    .. code-block:: none

        Couldn't match type 'Int' with 'Bool'
        Expected type: ST s Foo
          Actual type: MyBarST s

    が以下のような型エラーメッセージになります．

    .. code-block:: none

        Couldn't match type 'Int' with 'Bool'
        Expected type: ST s Foo
          Actual type: MyBarST s
        Type synonyms expanded:
        Expected type: ST s Int
          Actual type: ST s Bool

..
   .. ghc-flag:: -fprint-typechecker-elaboration

       When enabled, GHC also prints extra information from the typechecker in
       warnings. For example: ::

	   main :: IO ()
	   main = do
	     return $ let a = "hello" in a
	     return ()

       This warning message:

       .. code-block:: none

	   A do-notation statement discarded a result of type ‘[Char]’
	   Suppress this warning by saying
	     ‘_ <- ($) return let a = "hello" in a’
	   or by using the flag -fno-warn-unused-do-bind

       Becomes this:

       .. code-block:: none

	   A do-notation statement discarded a result of type ‘[Char]’
	   Suppress this warning by saying
	     ‘_ <- ($)
		     return
		     let
		       AbsBinds [] []
			 {Exports: [a <= a
				      <>]
			  Exported types: a :: [Char]
					  [LclId, Str=DmdType]
			  Binds: a = "hello"}
		     in a’
	   or by using the flag -fno-warn-unused-do-bind

.. ghc-flag:: -fprint-typechecker-elaboration

    これが有効であれば GHC は警告メッセージで型検査器よりの追加の情報を表示します．
    たとえば， ::

        main :: IO ()
        main = do
          return $ let a = "hello" in a
          return ()

    であるとします．以下の警告メッセージは

    .. code-block:: none

        A do-notation statement discarded a result of type ‘[Char]’
        Suppress this warning by saying
          ‘_ <- ($) return let a = "hello" in a’
        or by using the flag -fno-warn-unused-do-bind

    は以下のように表示されるようになります．

    .. code-block:: none

        A do-notation statement discarded a result of type ‘[Char]’
        Suppress this warning by saying
          ‘_ <- ($)
                  return
                  let
                    AbsBinds [] []
                      {Exports: [a <= a
                                   <>]
                       Exported types: a :: [Char]
                                       [LclId, Str=DmdType]
                       Binds: a = "hello"}
                  in a’
        or by using the flag -fno-warn-unused-do-bind

..
   .. ghc-flag:: -fdiagnostics-color=⟨always|auto|never⟩

       Causes GHC to display error messages with colors.  To do this, the
       terminal must have support for ANSI color codes, or else garbled text will
       appear.  The default value is ``auto``, which means GHC will make an
       attempt to detect whether terminal supports colors and choose accordingly.

       The precise color scheme is controlled by the environment variable
       ``GHC_COLORS`` (or ``GHC_COLOURS``).  This can be set to colon-separated
       list of ``key=value`` pairs.  These are the default settings:

       .. code-block:: none

	   header=:message=1:warning=1;35:error=1;31:fatal=1;31:margin=1;34

       Each value is expected to be a `Select Graphic Rendition (SGR) substring
       <https://en.wikipedia.org/wiki/ANSI_escape_code#graphics>`_.  The
       formatting of each element can inherit from parent elements.  For example,
       if ``header`` is left empty, it will inherit the formatting of
       ``message``.  Alternatively if ``header`` is set to ``1`` (bold), it will
       be bolded but still inherits the color of ``message``.

       Currently, in the primary message, the following inheritance tree is in
       place:

       - ``message``

	 - ``header``

	   - ``warning``
	   - ``error``
	   - ``fatal``

       In the caret diagnostics, there is currently no inheritance at all between
       ``margin``, ``warning``, ``error``, and ``fatal``.

       The environment variable can also be set to the magical values ``never``
       or ``always``, which is equivalent to setting the corresponding
       ``-fdiagnostics-color`` flag but with lower precedence.

.. ghc-flag:: -fdiagnostics-color=⟨always|auto|never⟩

    GHCに色付きのエラーメッセージを表示させます．これを行うには，端末がANSIカラーコードをサポートしている必要があります．
    ANSIカラーコードをサポートしていなければ，文字化けしたテキストが表示されます．
    デフォルト値は ``auto`` でGHCは端末が色をサポートしているかどうかを検出し，それに応じて選択します．

    正確な配色は，環境変数 ``GHC_COLORS`` (または ``GHC_COLOURS``)によって制御されます．
    これは，コロンで区切られた ``key=value`` ペアのリストで設定できます．
    デフォルトの設定は以下のようになっています．

    .. code-block:: none

	header=:message=1:warning=1;35:error=1;31:fatal=1;31:margin=1;34

    各値は `Select Graphic Rendition (SGR) substring <https://en.wikipedia.org/wiki/ANSI_escape_code#graphics>`_
    であることが期待されています．各要素の書式設定は親要素から継承できます．
    例でいえば ``header`` が空のままの場合，``message`` のフォーマットが継承されます．
    また，ヘッダーが ``1`` (bold)に設定されている場合は太字になりますが ``message`` の色が継承されます．

    現時点では，主要メッセージにおいて以下の継承ツリーが配置されています．

    - ``message``

      - ``header``

	- ``warning``
	- ``error``
	- ``fatal``

    キャレット付きの診断では， ``margin`` ， ``warning`` ， ``error`` ， ``fatal`` の間には現時点で継承されるものはありません．

    件の環境変数を ``always`` あるいは ``never`` という謎の値に設定することもできます．
    これは，対応する ``-fdiagnostics-color`` フラグを設定するのと同等ですが，優先順位はそれより低くなります．

..
   .. ghc-flag:: -f[no-]diagnostics-show-caret

       Controls whether GHC displays a line of the original source code where the
       error was detected.  This also affects the associated caret symbol that
       points at the region of code at fault.  The flag is on by default.

.. ghc-flag:: -f[no-]diagnostics-show-caret

    エラーが検出された元のソースコードの行をGHCが表示するかどうかを制御します．
    これは，障害のあるコードの領域を指すキャレットシンボルにも影響します．
    このフラグはデフォルトで有効になっています．

..
   .. ghc-flag:: -ferror-spans

       Causes GHC to emit the full source span of the syntactic entity
       relating to an error message. Normally, GHC emits the source
       location of the start of the syntactic entity only.

       For example:

       .. code-block:: none

	   test.hs:3:6: parse error on input `where'

       becomes:

       .. code-block:: none

	   test296.hs:3:6-10: parse error on input `where'

       And multi-line spans are possible too:

       .. code-block:: none

	   test.hs:(5,4)-(6,7):
	       Conflicting definitions for `a'
	       Bound at: test.hs:5:4
			 test.hs:6:7
	       In the binding group for: a, b, a

       Note that line numbers start counting at one, but column numbers
       start at zero. This choice was made to follow existing convention
       (i.e. this is how Emacs does it).

.. ghc-flag:: -ferror-spans

    これを有効にすると，GHC はエラーメッセージに関連する構文上の実体のソースコード上の範囲を表示します．
    通常 GHC は構文上の実体のソースコードの開始位置だけを表示します．

    たとえば，

    .. code-block:: none

        test.hs:3:6: parse error on input `where'

    という表示だったものが，

    .. code-block:: none

        test296.hs:3:6-10: parse error on input `where'

    のような表示になります．また，範囲は複数行にまたがることもあるので，その場合は

    .. code-block:: none

        test.hs:(5,4)-(6,7):
            Conflicting definitions for `a'
            Bound at: test.hs:5:4
                      test.hs:6:7
            In the binding group for: a, b, a

    のようになります．行番号は1から数えますが，カラム番号は0から数えることに注意してください．
    このような数えかたになっているのは，既存のよくある慣習(たとえば Emacs)にしたがったからです．

..
   .. ghc-flag:: -H ⟨size⟩

       Set the minimum size of the heap to ⟨size⟩. This option is
       equivalent to ``+RTS -Hsize``, see :ref:`rts-options-gc`.

.. ghc-flag:: -H ⟨size⟩

    ヒープの最小サイズを ⟨size⟩ に設定します．このオプションは
    ``+RTS -Hsize`` と同じです． :ref:`rts-options-gc` を参照してください．

..
   .. ghc-flag:: -Rghc-timing

       Prints a one-line summary of timing statistics for the GHC run. This
       option is equivalent to ``+RTS -tstderr``, see
       :ref:`rts-options-gc`.

.. ghc-flag:: -Rghc-timing

    GHC の実行に要した時間について統計情報を1行にまとめて表示します．
    このオプションは ``+RTS -tstderr`` と同じです．
    :ref:`rts-options-gc` を参照してください．

.. _options-platform:

Platform-specific Flags
-----------------------

.. index::
   single: -m\* options
   single: platform-specific options
   single: machine-specific options

Some flags only make sense for particular target platforms.

.. ghc-flag:: -msse2

    (x86 only, added in GHC 7.0.1) Use the SSE2 registers and
    instruction set to implement floating point operations when using
    the :ref:`native code generator <native-code-gen>`. This gives a
    substantial performance improvement for floating point, but the
    resulting compiled code will only run on processors that support
    SSE2 (Intel Pentium 4 and later, or AMD Athlon 64 and later). The
    :ref:`LLVM backend <llvm-code-gen>` will also use SSE2 if your
    processor supports it but detects this automatically so no flag is
    required.

    SSE2 is unconditionally used on x86-64 platforms.

.. ghc-flag:: -msse4.2

    (x86 only, added in GHC 7.4.1) Use the SSE4.2 instruction set to
    implement some floating point and bit operations when using the
    :ref:`native code generator <native-code-gen>`. The resulting compiled
    code will only run on processors that support SSE4.2 (Intel Core i7
    and later). The :ref:`LLVM backend <llvm-code-gen>` will also use
    SSE4.2 if your processor supports it but detects this automatically
    so no flag is required.
