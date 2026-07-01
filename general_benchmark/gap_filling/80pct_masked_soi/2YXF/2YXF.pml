# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.293391021924517

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 1+15+16+19+59+60+73+74+75+76
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2YXF and resi 4+7+14+19+22
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2YXF and resi 18 and name CA, 2YXF and resi 89 and name CA  # target=27.499999988982545 current=35.33799631324895
color yellow, pair_00
distance pair_01, 2YXF and resi 2 and name CA, 2YXF and resi 73 and name CA  # target=27.499999998529546 current=34.29043330409958
color yellow, pair_01
distance pair_02, 2YXF and resi 14 and name CA, 2YXF and resi 88 and name CA  # target=27.499999935561604 current=34.0699726182222
color yellow, pair_02
distance pair_03, 2YXF and resi 60 and name CA, 2YXF and resi 73 and name CA  # target=27.499999999692427 current=33.88826747529768
color yellow, pair_03
distance pair_04, 2YXF and resi 43 and name CA, 2YXF and resi 59 and name CA  # target=27.499998058526977 current=33.708605235607536
color yellow, pair_04
distance pair_05, 2YXF and resi 1 and name CA, 2YXF and resi 13 and name CA  # target=27.49999998232566 current=32.992898367422676
color yellow, pair_05
distance pair_06, 2YXF and resi 41 and name CA, 2YXF and resi 58 and name CA  # target=27.49999572906917 current=32.835686983485
color yellow, pair_06
distance pair_07, 2YXF and resi 19 and name CA, 2YXF and resi 32 and name CA  # target=27.499999995787018 current=32.770939246032135
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
