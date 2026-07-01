# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.112241867446896

load 1D0R.pdb, 1D0R
bg_color white
hide everything, 1D0R
show cartoon, 1D0R
color grey80, 1D0R
set cartoon_transparency, 0.1

select worst_residues, 1D0R and resi 2+5+6+8+10+13+15+19+21+22
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1D0R and resi 1 and name CA, 1D0R and resi 28 and name CA  # target=37.76671190901814 current=39.69506943071582
color yellow, pair_00
distance pair_01, 1D0R and resi 16 and name CA, 1D0R and resi 27 and name CA  # target=16.695088894137207 current=18.572875192036445
color yellow, pair_01
distance pair_02, 1D0R and resi 4 and name CA, 1D0R and resi 28 and name CA  # target=37.76027849352607 current=39.56726399019336
color yellow, pair_02
distance pair_03, 1D0R and resi 3 and name CA, 1D0R and resi 25 and name CA  # target=32.60823831678501 current=34.334488690451124
color yellow, pair_03
distance pair_04, 1D0R and resi 10 and name CA, 1D0R and resi 23 and name CA  # target=20.90193665261559 current=22.270781674001178
color yellow, pair_04
distance pair_05, 1D0R and resi 9 and name CA, 1D0R and resi 22 and name CA  # target=20.163105239453063 current=21.47790973686947
color yellow, pair_05
distance pair_06, 1D0R and resi 14 and name CA, 1D0R and resi 24 and name CA  # target=16.18307640021473 current=17.296961257911274
color yellow, pair_06
distance pair_07, 1D0R and resi 17 and name CA, 1D0R and resi 25 and name CA  # target=15.182729569859948 current=16.051219147197525
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
