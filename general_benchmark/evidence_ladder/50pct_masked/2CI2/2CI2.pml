# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.10003813685318363

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 1+26+35+36+37+39+41+42+53+54
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CI2 and resi 21 and name CA, 2CI2 and resi 35 and name CA  # target=23.815104100792308 current=24.388588800487625
color yellow, pair_00
distance pair_01, 2CI2 and resi 2 and name CA, 2CI2 and resi 35 and name CA  # target=23.67227737709955 current=24.22821973940989
color yellow, pair_01
distance pair_02, 2CI2 and resi 25 and name CA, 2CI2 and resi 37 and name CA  # target=26.531340713852973 current=25.975950827621418
color yellow, pair_02
distance pair_03, 2CI2 and resi 22 and name CA, 2CI2 and resi 41 and name CA  # target=23.950787490415287 current=24.497275996510226
color yellow, pair_03
distance pair_04, 2CI2 and resi 25 and name CA, 2CI2 and resi 34 and name CA  # target=23.990056817498818 current=24.527787037778552
color yellow, pair_04
distance pair_05, 2CI2 and resi 23 and name CA, 2CI2 and resi 40 and name CA  # target=23.856499351174737 current=24.379319308849
color yellow, pair_05
distance pair_06, 2CI2 and resi 1 and name CA, 2CI2 and resi 55 and name CA  # target=26.881016151929227 current=26.360020079824174
color yellow, pair_06
distance pair_07, 2CI2 and resi 12 and name CA, 2CI2 and resi 39 and name CA  # target=24.199508970921112 current=24.72001569120532
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
