require 'fileutils'

intro = <<EOS
\\include "./include/sc_functions.ly"
#(set-global-staff-size 18)
\\include "english.ly"
#(set-default-paper-size "letter")
EOS
cantusModern = <<EOS
\\book {
  \\bookOutputSuffix "cantus_modern_clef"
  \\header{
    title = "Dances"
    subtitle = "Cantus Part in Modern Clefs" 
    composer = "Gervaise"
    tagline = ""
  }
EOS

altusModern = <<EOS
\\book {
  \\bookOutputSuffix "altus_modern_clef"
  \\header{
    title = "Dances"
    subtitle = "Contratenor Part in Modern Clefs" 
    composer = "Gervaise"
    tagline = ""
  }
EOS
tenorModern = <<EOS
\\book {
  \\bookOutputSuffix "tenor_modern_clef"
  \\header{
    title = "Dances"
    subtitle = "Tenor Part in Modern Clefs" 
    composer = "Gervaise"
    tagline = ""
  }
EOS
bassusModern = <<EOS
\\book {
  \\bookOutputSuffix "bassus_modern_clef"
  \\header{
    title = "Dances"
    subtitle = "Bassus Part in Modern Clefs" 
    composer = "Gervaise"
    tagline = ""
  }
EOS
cantusOrig = <<EOS
\\book {
  \\bookOutputSuffix "cantus_orig_clef"
  \\header{
    title = "Dances"
    subtitle = "Cantus Part in Original Clefs" 
    composer = "Gervaise"
    tagline = ""
  }
EOS

altusOrig = <<EOS
\\book {
  \\bookOutputSuffix "altus_orig_clef"
  \\header{
    title = "Dances"
    subtitle = "Contratenor Part in Original Clefs" 
    composer = "Gervaise"
    tagline = ""
  }
EOS
tenorOrig = <<EOS
\\book {
  \\bookOutputSuffix "tenor_orig_clef"
  \\header{
    title = "Dances"
    subtitle = "Tenor Part in Original Clefs" 
    composer = "Gervaise"
    tagline = ""
  }
EOS
bassusOrig = <<EOS
\\book {
  \\bookOutputSuffix "bassus_orig_clef"
  \\header{
    title = "Dances"
    subtitle = "Bassus Part in Original Clefs" 
    composer = "Gervaise"
    tagline = ""
  }
EOS
lilyFiles = [] 
folders = Dir['./*/']
folders.delete_if{|x| x !~ /\d\d/}
folders.delete_if{|x| x =~ /pavane/}
folders.sort!
folders.each do |folder|
   file = File.basename(folder)
   lilyFiles.push("#{folder}#{file}.ly")
end

File.open("part_book.ly","w") do |f|
   index = 'a'
   f.puts intro
   lilyFiles.each do |lily| 
      open(lily, 'r').each do |l|
         if  l =~ /include/ then
            next
         end
         if  l =~ /version/ then
            next
         end
         if  l =~ /set-default-paper-size/ then
            next
         end
         if  l =~ /set-global-staff-size/ then
            next
         end
         l.sub!('scGlobal',"#{index}scGlobal")
         l.sub!('scTempo',"#{index}scTempo")
         l.sub!('scMusic',"#{index}scMusic")
         l.sub!('scTitle',"#{index}scTitle")
         l.sub!('scSubtitle',"#{index}scSubtitle")
         l.sub!('scMeter',"#{index}scMeter")
         l.sub!('scPoet',"#{index}scPoet")
         l.sub!('scComposer',"#{index}scCopyright")
         l.sub!('scTagline',"#{index}scTagline")
         l.sub!('scChordLine',"#{index}scChordLine")
         f.puts l 
      end 
      index.next!
   end

   hsh = { cantusOrig => {:number => 'One', :clef => 'Orig'},
           altusOrig => {:number => 'Two', :clef => 'Orig'},
           tenorOrig => {:number => 'Three', :clef => 'Orig'},
           bassusOrig => {:number => 'Four', :clef => 'Orig'},
           cantusModern => {:number => 'One', :clef => 'Modern'},
           altusModern => {:number => 'Two', :clef => 'Modern'},
           tenorModern => {:number => 'Three', :clef => 'Modern'},
           bassusModern => {:number => 'Four', :clef => 'Modern'},
         }
   hsh.each do |k,v|
      index = 'a'
      f.puts k
      lilyFiles.each do |lily| 
         f.puts "   \\score {\n       \\new Staff \\with { \\consists \"Ambitus_engraver\" } " 
         f.puts "        << \\#{index}scGlobal \\#{index}scMusic#{v[:number]}Clef#{v[:clef]} \\#{index}scMusic#{v[:number]} >>" 
         f.puts "       \\header { piece = \\#{index}scTitle }\n"
         f.puts "       \\layout { indent = 0\\mm }\n   }\n"
         index.next!
      end
      f.puts "}" 
   end
   f.puts "\\version \"2.12.0\"  % necessary for upgrading to future LilyPond versions. "
end
   
