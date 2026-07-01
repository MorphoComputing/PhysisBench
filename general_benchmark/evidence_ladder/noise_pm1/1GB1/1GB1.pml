# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5432842883380409

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 2+8+9+13+20+28+36+37+47+53
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 4+6+10+12
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 5 and name CA, 1GB1 and resi 32 and name CA  # target=15.161546375467742 current=11.249336340305435
color yellow, pair_00
distance pair_01, 1GB1 and resi 7 and name CA, 1GB1 and resi 29 and name CA  # target=9.989273036070287 current=13.218464705867369
color yellow, pair_01
distance pair_02, 1GB1 and resi 2 and name CA, 1GB1 and resi 38 and name CA  # target=20.391629501608577 current=17.316220591556153
color yellow, pair_02
distance pair_03, 1GB1 and resi 15 and name CA, 1GB1 and resi 46 and name CA  # target=18.794346019276038 current=15.89642050863275
color yellow, pair_03
distance pair_04, 1GB1 and resi 9 and name CA, 1GB1 and resi 48 and name CA  # target=21.366107875201497 current=24.180382929845525
color yellow, pair_04
distance pair_05, 1GB1 and resi 12 and name CA, 1GB1 and resi 28 and name CA  # target=14.825716457774055 current=17.482751288187533
color yellow, pair_05
distance pair_06, 1GB1 and resi 10 and name CA, 1GB1 and resi 20 and name CA  # target=27.324324285705202 current=29.962984413369604
color yellow, pair_06
distance pair_07, 1GB1 and resi 8 and name CA, 1GB1 and resi 54 and name CA  # target=8.005157894010154 current=5.373252803228786
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
