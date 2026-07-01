# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.2666502395388433

load 1D0R.pdb, 1D0R
bg_color white
hide everything, 1D0R
show cartoon, 1D0R
color grey80, 1D0R
set cartoon_transparency, 0.1

select worst_residues, 1D0R and resi 6+11+12+14+15+20+21+23+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1D0R and resi 28+992
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1D0R and resi 1 and name CA, 1D0R and resi 23 and name CA  # target=40.26808003479559 current=31.719439495548553
color yellow, pair_00
distance pair_01, 1D0R and resi 1 and name CA, 1D0R and resi 20 and name CA  # target=22.286650753599933 current=29.14804335259747
color yellow, pair_01
distance pair_02, 1D0R and resi 10 and name CA, 1D0R and resi 25 and name CA  # target=18.26753322212204 current=24.774563698152818
color yellow, pair_02
distance pair_03, 1D0R and resi 3 and name CA, 1D0R and resi 21 and name CA  # target=20.76896110520922 current=27.06752468916359
color yellow, pair_03
distance pair_04, 1D0R and resi 3 and name CA, 1D0R and resi 24 and name CA  # target=23.82783302570326 current=30.04779831737166
color yellow, pair_04
distance pair_05, 1D0R and resi 9 and name CA, 1D0R and resi 20 and name CA  # target=23.849957882777826 current=18.29797065921639
color yellow, pair_05
distance pair_06, 1D0R and resi 8 and name CA, 1D0R and resi 18 and name CA  # target=20.628114848271988 current=15.223254643007337
color yellow, pair_06
distance pair_07, 1D0R and resi 5 and name CA, 1D0R and resi 14 and name CA  # target=9.504366674052722 current=14.905992071672655
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
