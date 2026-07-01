# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6078206042619334

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 1+5+11+16+22+31+47+50+51+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1ENH and resi 4+5+29+42
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1ENH and resi 18 and name CA, 1ENH and resi 50 and name CA  # target=13.36939237278415 current=9.783818064495241
color yellow, pair_00
distance pair_01, 1ENH and resi 10 and name CA, 1ENH and resi 40 and name CA  # target=17.64663651338804 current=14.246180170837123
color yellow, pair_01
distance pair_02, 1ENH and resi 18 and name CA, 1ENH and resi 28 and name CA  # target=11.596459368156012 current=14.828723661133875
color yellow, pair_02
distance pair_03, 1ENH and resi 29 and name CA, 1ENH and resi 49 and name CA  # target=16.17662154039627 current=19.209184504494058
color yellow, pair_03
distance pair_04, 1ENH and resi 11 and name CA, 1ENH and resi 47 and name CA  # target=18.437368914489813 current=15.450093298971904
color yellow, pair_04
distance pair_05, 1ENH and resi 36 and name CA, 1ENH and resi 46 and name CA  # target=18.6104836479424 current=15.623783721693252
color yellow, pair_05
distance pair_06, 1ENH and resi 1 and name CA, 1ENH and resi 52 and name CA  # target=16.269262662088565 current=19.02154062227581
color yellow, pair_06
distance pair_07, 1ENH and resi 15 and name CA, 1ENH and resi 37 and name CA  # target=13.037546828578286 current=15.598102904433528
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
