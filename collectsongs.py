import os
import re
expr = re.compile("\.tex$")

songs = [song[:-4] for song in os.listdir("lieder") if expr.search(song)]
#songs = [song for song in songs if not "#" in song]
songs = sorted(songs)    

with open("liederliste.tex","w+") as f:
    for s in songs:
        ss = "\\include{%s}\n"%(os.path.join("lieder",s))
        f.write(ss)
        #print ss,
        
