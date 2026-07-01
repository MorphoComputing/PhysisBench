# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4749957528314102

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 1+2+3+42+43+44+54+55+86+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2ACY and resi 71 and name CA, 2ACY and resi 86 and name CA  # target=27.495334617380408 current=35.17159501275541
color yellow, pair_00
distance pair_01, 2ACY and resi 1 and name CA, 2ACY and resi 18 and name CA  # target=27.494492244720938 current=34.87285396236736
color yellow, pair_01
distance pair_02, 2ACY and resi 3 and name CA, 2ACY and resi 18 and name CA  # target=27.49417848676461 current=34.857466437067586
color yellow, pair_02
distance pair_03, 2ACY and resi 3 and name CA, 2ACY and resi 42 and name CA  # target=27.493791799868 current=34.696586663103965
color yellow, pair_03
distance pair_04, 2ACY and resi 3 and name CA, 2ACY and resi 43 and name CA  # target=27.4931567414063 current=34.502192594735334
color yellow, pair_04
distance pair_05, 2ACY and resi 1 and name CA, 2ACY and resi 42 and name CA  # target=27.493620053260216 current=34.485420050803754
color yellow, pair_05
distance pair_06, 2ACY and resi 2 and name CA, 2ACY and resi 42 and name CA  # target=27.49230714501474 current=34.424211968583144
color yellow, pair_06
distance pair_07, 2ACY and resi 18 and name CA, 2ACY and resi 86 and name CA  # target=27.49248080375915 current=34.38242309904398
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
