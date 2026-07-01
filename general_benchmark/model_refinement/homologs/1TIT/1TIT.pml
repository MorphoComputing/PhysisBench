# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 13.502518267986293

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 14+15+38+44+45+71+73+74+75+76
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 7+38+73+393+629+1029
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 62 and name CA, 1TIT and resi 73 and name CA  # target=24.33340848401449 current=3.9196598015933586
color yellow, pair_00
distance pair_01, 1TIT and resi 61 and name CA, 1TIT and resi 73 and name CA  # target=25.458369111408636 current=7.052905514009554
color yellow, pair_01
distance pair_02, 1TIT and resi 51 and name CA, 1TIT and resi 71 and name CA  # target=21.394022399008087 current=3.319517765901646
color yellow, pair_02
distance pair_03, 1TIT and resi 63 and name CA, 1TIT and resi 73 and name CA  # target=24.500187464267206 current=6.824527702941192
color yellow, pair_03
distance pair_04, 1TIT and resi 61 and name CA, 1TIT and resi 74 and name CA  # target=25.914168204762266 current=8.761281291480124
color yellow, pair_04
distance pair_05, 1TIT and resi 68 and name CA, 1TIT and resi 78 and name CA  # target=27.192762587081614 current=10.126483690551021
color yellow, pair_05
distance pair_06, 1TIT and resi 64 and name CA, 1TIT and resi 73 and name CA  # target=25.69766154908364 current=8.922032661177166
color yellow, pair_06
distance pair_07, 1TIT and resi 67 and name CA, 1TIT and resi 78 and name CA  # target=27.257467082096852 current=10.556614309294124
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
