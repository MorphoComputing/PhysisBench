# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.870005686029776

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 11+17+19+20+22+34+40+45+46+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 2+9+12+19
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 1 and name CA, 2HIU and resi 46 and name CA  # target=15.614474064079806 current=8.838119519314134
color yellow, pair_00
distance pair_01, 2HIU and resi 3 and name CA, 2HIU and resi 46 and name CA  # target=15.814314908141993 current=10.070172840055577
color yellow, pair_01
distance pair_02, 2HIU and resi 2 and name CA, 2HIU and resi 46 and name CA  # target=13.451780215988657 current=7.755229144120075
color yellow, pair_02
distance pair_03, 2HIU and resi 1 and name CA, 2HIU and resi 45 and name CA  # target=14.855872367883183 current=9.49057909720894
color yellow, pair_03
distance pair_04, 2HIU and resi 4 and name CA, 2HIU and resi 46 and name CA  # target=18.456362522224747 current=13.224365307370226
color yellow, pair_04
distance pair_05, 2HIU and resi 19 and name CA, 2HIU and resi 36 and name CA  # target=7.678419910973636 current=3.1058041928636
color yellow, pair_05
distance pair_06, 2HIU and resi 3 and name CA, 2HIU and resi 45 and name CA  # target=16.34324174806129 current=11.772007379151592
color yellow, pair_06
distance pair_07, 2HIU and resi 2 and name CA, 2HIU and resi 45 and name CA  # target=13.311062734610864 current=8.778409775929887
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
