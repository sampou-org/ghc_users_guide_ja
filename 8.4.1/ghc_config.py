extlinks = {
    'ghc-ticket': ('https://ghc.haskell.org/trac/ghc/ticket/%s', 'Trac #'),
    'ghc-wiki': ('https://ghc.haskell.org/trac/ghc/wiki/%s', 'Trac #'),
}

libs_base_uri = '../libraries'
lib_versions = {
    'base': '4.11.0.0',
    'ghc-prim': '0.5.2.0',
    'template-haskell': '@LIBRARY_template_haskell_VERSION@',
    'ghc-compact': '0.1.0.0',
    'ghc': '8.4.1',
    'parallel': '@LIBRARY_parallel_VERSION@',
    'Cabal': '2.2.0.0',
    'array': '@LIBRARY_array_VERSION@',
}

version = '8.4.1'

llvm_version = '5.0'
