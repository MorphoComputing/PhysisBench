# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5199685918238034

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 1+2+3+7+12+15+16+28+38+53
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1KTH and resi 14 and name CA, 1KTH and resi 27 and name CA  # target=27.491686344161042 current=28.88874726102667
color yellow, pair_00
distance pair_01, 1KTH and resi 13 and name CA, 1KTH and resi 55 and name CA  # target=27.490495840610627 current=28.86784528064329
color yellow, pair_01
distance pair_02, 1KTH and resi 7 and name CA, 1KTH and resi 40 and name CA  # target=8.185196508984983 current=7.2190424185039275
color yellow, pair_02
distance pair_03, 1KTH and resi 13 and name CA, 1KTH and resi 52 and name CA  # target=27.469762587636183 current=28.22933279739555
color yellow, pair_03
distance pair_04, 1KTH and resi 15 and name CA, 1KTH and resi 44 and name CA  # target=15.799787131047644 current=16.470545015722507
color yellow, pair_04
distance pair_05, 1KTH and resi 7 and name CA, 1KTH and resi 47 and name CA  # target=16.42479639236093 current=17.074505870322604
color yellow, pair_05
distance pair_06, 1KTH and resi 15 and name CA, 1KTH and resi 55 and name CA  # target=27.442209937621637 current=28.07315149945187
color yellow, pair_06
distance pair_07, 1KTH and resi 4 and name CA, 1KTH and resi 14 and name CA  # target=23.75773081649566 current=24.38049637069372
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
