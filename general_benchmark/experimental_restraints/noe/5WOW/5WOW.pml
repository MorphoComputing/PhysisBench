# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.178000432959301

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 13+14+15+17+18+19+23+24+26+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 5WOW and resi 3+12
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 5WOW and resi 8 and name CA, 5WOW and resi 28 and name CA  # target=3.807615173945761 current=7.326983254577733
color yellow, pair_00
distance pair_01, 5WOW and resi 12 and name CA, 5WOW and resi 22 and name CA  # target=5.4040284177073215 current=8.859258634140794
color yellow, pair_01
distance pair_02, 5WOW and resi 3 and name CA, 5WOW and resi 30 and name CA  # target=3.807615173945761 current=7.254809358802013
color yellow, pair_02
distance pair_03, 5WOW and resi 13 and name CA, 5WOW and resi 21 and name CA  # target=4.346675847658586 current=7.001257391715936
color yellow, pair_03
distance pair_04, 5WOW and resi 2 and name CA, 5WOW and resi 19 and name CA  # target=6.1211101882448276 current=8.665952521963975
color yellow, pair_04
distance pair_05, 5WOW and resi 13 and name CA, 5WOW and resi 22 and name CA  # target=4.140074046378043 current=6.645239295833923
color yellow, pair_05
distance pair_06, 5WOW and resi 21 and name CA, 5WOW and resi 29 and name CA  # target=5.790717228239924 current=7.8659141813663656
color yellow, pair_06
distance pair_07, 5WOW and resi 1 and name CA, 5WOW and resi 19 and name CA  # target=6.1211101882448276 current=7.918153751918256
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
