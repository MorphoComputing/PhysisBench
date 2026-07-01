# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.5130553326530833

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+3+5+7+24+25+27+31+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HPH and resi 2 and name CA, 1HPH and resi 33 and name CA  # target=27.489702366267966 current=25.212001118152642
color yellow, pair_00
distance pair_01, 1HPH and resi 1 and name CA, 1HPH and resi 9 and name CA  # target=13.550034311833087 current=11.916106852135902
color yellow, pair_01
distance pair_02, 1HPH and resi 6 and name CA, 1HPH and resi 17 and name CA  # target=19.61438040994305 current=18.20182223729404
color yellow, pair_02
distance pair_03, 1HPH and resi 1 and name CA, 1HPH and resi 30 and name CA  # target=27.499732398159242 current=28.53204513770275
color yellow, pair_03
distance pair_04, 1HPH and resi 5 and name CA, 1HPH and resi 16 and name CA  # target=16.86867266847248 current=17.866936782169034
color yellow, pair_04
distance pair_05, 1HPH and resi 14 and name CA, 1HPH and resi 23 and name CA  # target=10.834798306113466 current=11.82334411381346
color yellow, pair_05
distance pair_06, 1HPH and resi 1 and name CA, 1HPH and resi 18 and name CA  # target=21.69040182530946 current=22.676462583933212
color yellow, pair_06
distance pair_07, 1HPH and resi 13 and name CA, 1HPH and resi 21 and name CA  # target=12.68767386640893 current=13.648352445568685
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
