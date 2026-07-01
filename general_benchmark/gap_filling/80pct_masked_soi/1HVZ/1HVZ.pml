# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.1692518376811336

load 1HVZ.pdb, 1HVZ
bg_color white
hide everything, 1HVZ
show cartoon, 1HVZ
color grey80, 1HVZ
set cartoon_transparency, 0.1

select worst_residues, 1HVZ and resi 1+3+4+5+6+7+8+9+12+16
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HVZ and resi 4 and name CA, 1HVZ and resi 15 and name CA  # target=8.79542026899863 current=8.405124516926268
color yellow, pair_00
distance pair_01, 1HVZ and resi 1 and name CA, 1HVZ and resi 9 and name CA  # target=19.94800020743144 current=20.29496358842334
color yellow, pair_01
distance pair_02, 1HVZ and resi 2 and name CA, 1HVZ and resi 12 and name CA  # target=10.189814327988508 current=10.50021850316388
color yellow, pair_02
distance pair_03, 1HVZ and resi 6 and name CA, 1HVZ and resi 16 and name CA  # target=13.397061066638866 current=13.577611983283564
color yellow, pair_03
distance pair_04, 1HVZ and resi 3 and name CA, 1HVZ and resi 13 and name CA  # target=5.521119401847383 current=5.67272748007182
color yellow, pair_04
distance pair_05, 1HVZ and resi 1 and name CA, 1HVZ and resi 16 and name CA  # target=5.625313803746642 current=5.536733378813278
color yellow, pair_05
distance pair_06, 1HVZ and resi 6 and name CA, 1HVZ and resi 14 and name CA  # target=10.288848433429157 current=10.203453250088447
color yellow, pair_06
distance pair_07, 1HVZ and resi 3 and name CA, 1HVZ and resi 15 and name CA  # target=6.697087098117435 current=6.618369080337455
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
