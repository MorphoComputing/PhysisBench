# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.717500424169318

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 1+2+3+4+5+6+11+18+23+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2B4N and resi 1 and name CA, 2B4N and resi 35 and name CA  # target=52.212807686740746 current=50.963587052912885
color yellow, pair_00
distance pair_01, 2B4N and resi 2 and name CA, 2B4N and resi 16 and name CA  # target=17.695610245417637 current=16.539833157341207
color yellow, pair_01
distance pair_02, 2B4N and resi 5 and name CA, 2B4N and resi 31 and name CA  # target=42.487218502248815 current=43.604268740475725
color yellow, pair_02
distance pair_03, 2B4N and resi 20 and name CA, 2B4N and resi 37 and name CA  # target=32.137053672331234 current=31.14766281748916
color yellow, pair_03
distance pair_04, 2B4N and resi 11 and name CA, 2B4N and resi 34 and name CA  # target=37.488409500881865 current=36.56571064161184
color yellow, pair_04
distance pair_05, 2B4N and resi 9 and name CA, 2B4N and resi 33 and name CA  # target=37.648215138948 current=38.55176264770338
color yellow, pair_05
distance pair_06, 2B4N and resi 6 and name CA, 2B4N and resi 34 and name CA  # target=47.472560153285606 current=48.360565806259444
color yellow, pair_06
distance pair_07, 2B4N and resi 9 and name CA, 2B4N and resi 38 and name CA  # target=51.982040496003165 current=51.174507214227326
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
