# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.05721020919627268

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+2+9+11+14+23+25+33+35+36
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 5WOW and resi 14 and name CA, 5WOW and resi 36 and name CA  # target=23.707063355229984 current=24.23225216983913
color yellow, pair_00
distance pair_01, 5WOW and resi 11 and name CA, 5WOW and resi 36 and name CA  # target=23.232584572202892 current=23.6139080640397
color yellow, pair_01
distance pair_02, 5WOW and resi 12 and name CA, 5WOW and resi 36 and name CA  # target=23.12307983810166 current=23.47587690109203
color yellow, pair_02
distance pair_03, 5WOW and resi 14 and name CA, 5WOW and resi 33 and name CA  # target=21.318852755972575 current=21.489630258816636
color yellow, pair_03
distance pair_04, 5WOW and resi 12 and name CA, 5WOW and resi 34 and name CA  # target=20.609328998821628 current=20.74396462547289
color yellow, pair_04
distance pair_05, 5WOW and resi 17 and name CA, 5WOW and resi 35 and name CA  # target=20.25136196329656 current=20.38489717908399
color yellow, pair_05
distance pair_06, 5WOW and resi 13 and name CA, 5WOW and resi 36 and name CA  # target=21.558239923117732 current=21.69084208828698
color yellow, pair_06
distance pair_07, 5WOW and resi 11 and name CA, 5WOW and resi 37 and name CA  # target=20.832202162788555 current=20.951890354418843
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
