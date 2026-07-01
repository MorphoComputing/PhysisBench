# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.0967125805326736

load 3IOL.pdb, 3IOL
bg_color white
hide everything, 3IOL
show cartoon, 3IOL
color grey80, 3IOL
set cartoon_transparency, 0.1

select worst_residues, 3IOL and resi 1+4+5+9+16+18+19+20+21+23
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 3IOL and resi 13+466
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 3IOL and resi 3 and name CA, 3IOL and resi 22 and name CA  # target=34.14418350946395 current=28.627939866348722
color yellow, pair_00
distance pair_01, 3IOL and resi 3 and name CA, 3IOL and resi 18 and name CA  # target=29.322683412848537 current=24.111220042866695
color yellow, pair_01
distance pair_02, 3IOL and resi 1 and name CA, 3IOL and resi 24 and name CA  # target=35.41775339885384 current=30.867599579285038
color yellow, pair_02
distance pair_03, 3IOL and resi 1 and name CA, 3IOL and resi 22 and name CA  # target=33.798392858105686 current=29.264739272354856
color yellow, pair_03
distance pair_04, 3IOL and resi 7 and name CA, 3IOL and resi 22 and name CA  # target=17.55281836988882 current=22.060701481642127
color yellow, pair_04
distance pair_05, 3IOL and resi 5 and name CA, 3IOL and resi 15 and name CA  # target=21.36569987852571 current=17.096031913457843
color yellow, pair_05
distance pair_06, 3IOL and resi 2 and name CA, 3IOL and resi 11 and name CA  # target=10.47730002165514 current=14.650765860658035
color yellow, pair_06
distance pair_07, 3IOL and resi 6 and name CA, 3IOL and resi 22 and name CA  # target=18.38903189852434 current=22.555702056285934
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
