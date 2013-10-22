\include "../include/sc_functions.ly"
\include "english.ly"
#(set-default-paper-size "letter")
#(set-global-staff-size 18)
scTempo = #(ly:make-moment 165 2)

scGlobal = {
  \key f \major
  \time 4/2
}

scTitle = "02 Pavane"
scSubtitle = \markup \italic "From Pierre Attaignant's Fourth Book of Dances"
scMeter = ""
scPoet = ""
scComposer = "Claude Gervaise"
scCopyright = ""
scTagline = ""

scMusicOneClefOrig = \clef soprano
scMusicOneClefModern = \clef treble
scMusicOne = \relative c'' {  
   
   \repeat volta 2 {
   }
   \repeat volta 2 {
   }
   
}


scMusicTwoClefOrig = \clef alto
scMusicTwoClefModern = \clef treble 
scMusicTwo =  \relative c' {  
   \repeat volta 2 {
   }
   \repeat volta 2 {
   }
}
scMusicThreeClefOrig = \clef tenor 
scMusicThreeClefModern = \clef "G_8" 
scMusicThree = \relative c' {
   \repeat volta 2 {
   }
   \repeat volta 2 {
   }
}

scMusicFourClefOrig = \clef bass
scMusicFourClefModern = \clef bass
scMusicFour = \relative c' {

   \repeat volta 2 {
   }
   \repeat volta 2 {
   }
}

scMusicFiveClefOrig = \clef soprano
scMusicFiveClefModern = \clef bass
scMusicFive = \relative c'' {

   \repeat volta 2 {
       bf1 bf2 bf c2. bf4 a2 g f g d g g1 g g g2 g a1 r2 d2 d bf2 c4 bf a g a1 a1 
   }
   \repeat volta 2 {
       a1 d,2 f g1 d2 d' e  c d1 g, g g d2 a' g1. f4 e d2 g d'1 bf\breve
   }
}

scChordLine = \chordmode {

}

\include "../include/sc_a5.ly"

\version "2.12.0"  % necessary for upgrading to future LilyPond versions.
