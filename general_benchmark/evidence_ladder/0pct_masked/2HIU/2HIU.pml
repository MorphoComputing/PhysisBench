# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9409214513719305

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 7+15+16+17+19+20+21+22+40+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 14 and name CA, 2HIU and resi 22 and name CA  # target=12.069753078557488 current=9.468932452251817
color yellow, pair_00
distance pair_01, 2HIU and resi 10 and name CA, 2HIU and resi 22 and name CA  # target=6.623354934960444 current=4.206535648701724
color yellow, pair_01
distance pair_02, 2HIU and resi 13 and name CA, 2HIU and resi 21 and name CA  # target=11.193929173959464 current=8.831280332379963
color yellow, pair_02
distance pair_03, 2HIU and resi 16 and name CA, 2HIU and resi 40 and name CA  # target=10.659237866524693 current=13.006329825217636
color yellow, pair_03
distance pair_04, 2HIU and resi 8 and name CA, 2HIU and resi 40 and name CA  # target=24.113344292361486 current=26.228752376615112
color yellow, pair_04
distance pair_05, 2HIU and resi 13 and name CA, 2HIU and resi 22 and name CA  # target=13.262851727252887 current=11.197787145674475
color yellow, pair_05
distance pair_06, 2HIU and resi 9 and name CA, 2HIU and resi 40 and name CA  # target=22.306738265539902 current=24.27899915661039
color yellow, pair_06
distance pair_07, 2HIU and resi 13 and name CA, 2HIU and resi 40 and name CA  # target=14.309851904874826 current=16.25207358255054
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
