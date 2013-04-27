\include "../include/pp_functions.ly"
\include "english.ly"
#(set-default-paper-size "letter")
#(set-global-staff-size 18)
ppTempo = #(ly:make-moment 165 2)

global= {
  \key c \major
  \time 3/2
}

\header{
  title = "40 Galliard"
  subtitle = \markup \italic "From Pierre Attaignant's Fourth Book of Dances"
  meter = ""
  poet = ""
  composer = "Claude Gervaise"
  copyright = ""
  tagline = ""
}


ppMusicOne = \relative c'' {  
   \clef soprano
   \repeat volta 2 {
      r2 c2 c | c b4 a b c | d2 c c | b c1
   }
   \repeat volta 2 {
     r2 g2 a | b c2. b4 | a2 g2 f1 e
   }
   \repeat volta 2 {
     r2 c'2 c | b a b2. a4 a1 | g2 a1
   }
   
}


ppMusicTwo =  \relative c' {  
\clef alto
   \repeat volta 2 {
      r2 e2 a,4 b | c d e f g2 | f2 e d1 c1
   }
   \repeat volta 2 {
      r2 c2 c | d e a,2. b4 c2 a1 a 
   }
   \repeat volta 2 {
      r2 e'2 e2. d4 c2 b d4 c b a b1 a1
   }
}
ppMusicThree = \relative c' {
\clef alto
   \repeat volta 2 {
      r2 e2 f e4 f g2 d2 a'2 g a g e1
   }
   \repeat volta 2 {
      r2 e2 e g g c,2. d4 e2 d1 c
   }
   \repeat volta 2 {
      r2 c2 c g'2 f d4 e f2 d2 e1 c
   }
}

ppMusicFour = \relative c {
\clef bass
   \repeat volta 2 {
      r2 c2 f a g1 d2 e f g c,1
   }
   \repeat volta 2 {
      r2 c2 a g c2 f1 c2 d1 a
   }
   \repeat volta 2 {
      r2 a4 b c d e2 f g d2 f e1 a,1
   }
}


ppChordLine = \chordmode {

}

\include "../include/ppile_a4.ly"

\version "2.12.0"  % necessary for upgrading to future LilyPond versions.