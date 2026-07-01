# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.04557685461578578

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 8+18+21+22+23+27+30+44+45+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SHG and resi 1 and name CA, 1SHG and resi 12 and name CA  # target=23.795104396412707 current=24.377224890525145
color yellow, pair_00
distance pair_01, 1SHG and resi 14 and name CA, 1SHG and resi 54 and name CA  # target=23.424799656483003 current=23.94505181547056
color yellow, pair_01
distance pair_02, 1SHG and resi 13 and name CA, 1SHG and resi 55 and name CA  # target=26.723622804999486 current=26.306196278795063
color yellow, pair_02
distance pair_03, 1SHG and resi 1 and name CA, 1SHG and resi 14 and name CA  # target=23.183462060243574 current=23.589737836459037
color yellow, pair_03
distance pair_04, 1SHG and resi 13 and name CA, 1SHG and resi 54 and name CA  # target=22.99130700364859 current=23.351958583963565
color yellow, pair_04
distance pair_05, 1SHG and resi 2 and name CA, 1SHG and resi 13 and name CA  # target=22.70234894604618 current=22.98149833555628
color yellow, pair_05
distance pair_06, 1SHG and resi 32 and name CA, 1SHG and resi 41 and name CA  # target=21.377931352452688 current=21.6127347534017
color yellow, pair_06
distance pair_07, 1SHG and resi 31 and name CA, 1SHG and resi 42 and name CA  # target=21.229963432250152 current=21.452429836963432
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
