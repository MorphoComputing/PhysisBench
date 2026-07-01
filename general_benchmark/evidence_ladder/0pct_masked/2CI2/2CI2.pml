# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.033323186529394054

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 1+2+25+33+41+42+43+53+54+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CI2 and resi 1 and name CA, 2CI2 and resi 53 and name CA  # target=27.49944500964246 current=30.47821772443947
color yellow, pair_00
distance pair_01, 2CI2 and resi 1 and name CA, 2CI2 and resi 54 and name CA  # target=27.498196227295463 current=29.804387474209946
color yellow, pair_01
distance pair_02, 2CI2 and resi 1 and name CA, 2CI2 and resi 56 and name CA  # target=23.819816611298062 current=24.436969878661042
color yellow, pair_02
distance pair_03, 2CI2 and resi 3 and name CA, 2CI2 and resi 54 and name CA  # target=23.84027883570952 current=24.451432347578496
color yellow, pair_03
distance pair_04, 2CI2 and resi 21 and name CA, 2CI2 and resi 35 and name CA  # target=23.815104100792308 current=24.423584135050636
color yellow, pair_04
distance pair_05, 2CI2 and resi 39 and name CA, 2CI2 and resi 54 and name CA  # target=24.07838828663903 current=24.67815874282352
color yellow, pair_05
distance pair_06, 2CI2 and resi 41 and name CA, 2CI2 and resi 55 and name CA  # target=23.784406514130485 current=24.383849312000095
color yellow, pair_06
distance pair_07, 2CI2 and resi 2 and name CA, 2CI2 and resi 35 and name CA  # target=23.67227737709955 current=24.270887467905773
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
