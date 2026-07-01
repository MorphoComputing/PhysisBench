# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.2351442167217683

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 14+28+40+51+52+53+57+65+86+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 46
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 1 and name CA, 1TIT and resi 87 and name CA  # target=27.49872821152216 current=37.341982974829946
color yellow, pair_00
distance pair_01, 1TIT and resi 26 and name CA, 1TIT and resi 87 and name CA  # target=27.498897374247104 current=37.2940222488867
color yellow, pair_01
distance pair_02, 1TIT and resi 28 and name CA, 1TIT and resi 87 and name CA  # target=27.498232392005512 current=36.91359952932133
color yellow, pair_02
distance pair_03, 1TIT and resi 27 and name CA, 1TIT and resi 87 and name CA  # target=27.498294803288086 current=36.74022766174644
color yellow, pair_03
distance pair_04, 1TIT and resi 25 and name CA, 1TIT and resi 87 and name CA  # target=27.49722644805243 current=35.704686014616485
color yellow, pair_04
distance pair_05, 1TIT and resi 75 and name CA, 1TIT and resi 87 and name CA  # target=27.495701814043144 current=35.689843185563944
color yellow, pair_05
distance pair_06, 1TIT and resi 29 and name CA, 1TIT and resi 87 and name CA  # target=27.495724030857353 current=35.602351242651736
color yellow, pair_06
distance pair_07, 1TIT and resi 76 and name CA, 1TIT and resi 87 and name CA  # target=27.495626168494724 current=35.531119142306466
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
