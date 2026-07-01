# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.1461237939140014

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+4+5+6+11+13+14+15+16+17
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2KNM and resi 6
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2KNM and resi 10 and name CA, 2KNM and resi 27 and name CA  # target=11.094355853268544 current=13.883121696877629
color yellow, pair_00
distance pair_01, 2KNM and resi 5 and name CA, 2KNM and resi 14 and name CA  # target=3.807615173945761 current=6.561926922088282
color yellow, pair_01
distance pair_02, 2KNM and resi 6 and name CA, 2KNM and resi 26 and name CA  # target=4.145201824648677 current=6.8695321827115965
color yellow, pair_02
distance pair_03, 2KNM and resi 3 and name CA, 2KNM and resi 27 and name CA  # target=3.6850847653642034 current=5.713138777083378
color yellow, pair_03
distance pair_04, 2KNM and resi 2 and name CA, 2KNM and resi 28 and name CA  # target=4.298255009038828 current=6.281065741655849
color yellow, pair_04
distance pair_05, 2KNM and resi 6 and name CA, 2KNM and resi 25 and name CA  # target=5.212492862963047 current=7.148554678678154
color yellow, pair_05
distance pair_06, 2KNM and resi 1 and name CA, 2KNM and resi 10 and name CA  # target=15.390072669401093 current=13.510523262722163
color yellow, pair_06
distance pair_07, 2KNM and resi 3 and name CA, 2KNM and resi 28 and name CA  # target=4.357620936895633 current=6.224980498243922
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
