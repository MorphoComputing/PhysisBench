# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 9.194537660669921

load 1FKF.pdb, 1FKF
bg_color white
hide everything, 1FKF
show cartoon, 1FKF
color grey80, 1FKF
set cartoon_transparency, 0.1

select worst_residues, 1FKF and resi 2+3+4+17+31+68+69+71+87+88
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1FKF and resi 6+35+65+204+293+492
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1FKF and resi 31 and name CA, 1FKF and resi 42 and name CA  # target=23.742872347676254 current=4.992132609145656
color yellow, pair_00
distance pair_01, 1FKF and resi 2 and name CA, 1FKF and resi 22 and name CA  # target=20.119618802832928 current=3.0743709815386486
color yellow, pair_01
distance pair_02, 1FKF and resi 4 and name CA, 1FKF and resi 44 and name CA  # target=20.78010880480235 current=5.461112886022147
color yellow, pair_02
distance pair_03, 1FKF and resi 31 and name CA, 1FKF and resi 95 and name CA  # target=9.912688687589666 current=24.552684510405463
color yellow, pair_03
distance pair_04, 1FKF and resi 18 and name CA, 1FKF and resi 52 and name CA  # target=12.047257032392485 current=26.377847727199715
color yellow, pair_04
distance pair_05, 1FKF and resi 18 and name CA, 1FKF and resi 50 and name CA  # target=6.989307442071175 current=20.994190272604772
color yellow, pair_05
distance pair_06, 1FKF and resi 34 and name CA, 1FKF and resi 43 and name CA  # target=17.209497615931255 current=3.3800726689220304
color yellow, pair_06
distance pair_07, 1FKF and resi 66 and name CA, 1FKF and resi 76 and name CA  # target=21.92705116565988 current=8.88619616054555
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
