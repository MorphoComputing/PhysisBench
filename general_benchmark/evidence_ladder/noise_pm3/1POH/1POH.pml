# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4362225233591364

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 1+2+3+10+29+68+71+72+74+78
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1POH and resi 46+82+678+1528
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1POH and resi 1 and name CA, 1POH and resi 74 and name CA  # target=13.562766107753376 current=4.511546342402548
color yellow, pair_00
distance pair_01, 1POH and resi 29 and name CA, 1POH and resi 43 and name CA  # target=18.957718830824568 current=9.931341381364087
color yellow, pair_01
distance pair_02, 1POH and resi 30 and name CA, 1POH and resi 75 and name CA  # target=18.803258116898647 current=9.94772044151476
color yellow, pair_02
distance pair_03, 1POH and resi 2 and name CA, 1POH and resi 74 and name CA  # target=12.791748861975199 current=4.011091645978014
color yellow, pair_03
distance pair_04, 1POH and resi 17 and name CA, 1POH and resi 39 and name CA  # target=10.925346653432197 current=19.58663804991297
color yellow, pair_04
distance pair_05, 1POH and resi 32 and name CA, 1POH and resi 44 and name CA  # target=14.180923009375288 current=5.70621371755578
color yellow, pair_05
distance pair_06, 1POH and resi 2 and name CA, 1POH and resi 71 and name CA  # target=18.059019667883213 current=10.093872276874286
color yellow, pair_06
distance pair_07, 1POH and resi 28 and name CA, 1POH and resi 38 and name CA  # target=15.423285168647094 current=23.2634306927461
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
