# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.131290031577877

load 1FKF.pdb, 1FKF
bg_color white
hide everything, 1FKF
show cartoon, 1FKF
color grey80, 1FKF
set cartoon_transparency, 0.1

select worst_residues, 1FKF and resi 10+12+83+84+85+87+88+89+91+92
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1FKF and resi 4+18+56+80
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1FKF and resi 55 and name CA, 1FKF and resi 87 and name CA  # target=15.24299083272479 current=7.251461227564351
color yellow, pair_00
distance pair_01, 1FKF and resi 54 and name CA, 1FKF and resi 84 and name CA  # target=16.494791110933946 current=9.82859999266062
color yellow, pair_01
distance pair_02, 1FKF and resi 56 and name CA, 1FKF and resi 83 and name CA  # target=15.126772204347489 current=8.755216915214955
color yellow, pair_02
distance pair_03, 1FKF and resi 11 and name CA, 1FKF and resi 92 and name CA  # target=27.499999956071324 current=32.56812508872247
color yellow, pair_03
distance pair_04, 1FKF and resi 55 and name CA, 1FKF and resi 83 and name CA  # target=14.16668089672507 current=9.150033387728175
color yellow, pair_04
distance pair_05, 1FKF and resi 79 and name CA, 1FKF and resi 87 and name CA  # target=16.72697558704531 current=11.80399475605091
color yellow, pair_05
distance pair_06, 1FKF and resi 12 and name CA, 1FKF and resi 89 and name CA  # target=27.499999962123418 current=32.01276860435332
color yellow, pair_06
distance pair_07, 1FKF and resi 18 and name CA, 1FKF and resi 32 and name CA  # target=27.499974912999285 current=31.839744783466518
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
