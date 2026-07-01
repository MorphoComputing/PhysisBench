# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.159682335065693

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 14+15+18+19+20+32+35+36+46+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 5+8
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 37 and name CA, 2HIU and resi 47 and name CA  # target=20.450742705678927 current=10.66412444957376
color yellow, pair_00
distance pair_01, 2HIU and resi 31 and name CA, 2HIU and resi 47 and name CA  # target=18.567863240748395 current=11.244248496090666
color yellow, pair_01
distance pair_02, 2HIU and resi 14 and name CA, 2HIU and resi 22 and name CA  # target=12.069753078557488 current=4.817822288706564
color yellow, pair_02
distance pair_03, 2HIU and resi 13 and name CA, 2HIU and resi 22 and name CA  # target=13.262851727252887 current=6.054346522286791
color yellow, pair_03
distance pair_04, 2HIU and resi 13 and name CA, 2HIU and resi 21 and name CA  # target=11.193929173959464 current=4.093358498438996
color yellow, pair_04
distance pair_05, 2HIU and resi 18 and name CA, 2HIU and resi 47 and name CA  # target=14.20309319474721 current=9.298051900283108
color yellow, pair_05
distance pair_06, 2HIU and resi 12 and name CA, 2HIU and resi 25 and name CA  # target=14.027088169238999 current=9.846835443866597
color yellow, pair_06
distance pair_07, 2HIU and resi 32 and name CA, 2HIU and resi 44 and name CA  # target=11.926734739204411 current=7.884761753064297
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
