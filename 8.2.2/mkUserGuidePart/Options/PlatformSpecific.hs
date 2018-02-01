module Options.PlatformSpecific where

import Types

platformSpecificOptions :: [Flag]
platformSpecificOptions =
  [ flag { flagName = "-msse2"
         , flagDescription = "(x86 のみ) 浮動小数点演算に SSE2 を使う"
         , flagType = DynamicFlag
         }
  , flag { flagName = "-msse4.2"
         , flagDescription = "(x86 のみ) 浮動小数点演算に SSE4.2 を使う"
         , flagType = DynamicFlag
         }
  ]
