# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.1792613278816333

load 1D0R.pdb, 1D0R
bg_color white
hide everything, 1D0R
show cartoon, 1D0R
color grey80, 1D0R
set cartoon_transparency, 0.1

select worst_residues, 1D0R and resi 5+8+9+13+14+15+21+22+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1D0R and resi 4 and name CA, 1D0R and resi 28 and name CA  # target=37.76027849352607 current=39.91206154213638
color yellow, pair_00
distance pair_01, 1D0R and resi 1 and name CA, 1D0R and resi 19 and name CA  # target=27.526744714400092 current=28.956569165947915
color yellow, pair_01
distance pair_02, 1D0R and resi 1 and name CA, 1D0R and resi 17 and name CA  # target=22.85455155080484 current=24.274186200774135
color yellow, pair_02
distance pair_03, 1D0R and resi 10 and name CA, 1D0R and resi 23 and name CA  # target=20.90193665261559 current=22.27174815831053
color yellow, pair_03
distance pair_04, 1D0R and resi 2 and name CA, 1D0R and resi 20 and name CA  # target=27.177542659972946 current=28.5009685813519
color yellow, pair_04
distance pair_05, 1D0R and resi 2 and name CA, 1D0R and resi 14 and name CA  # target=15.97278176042958 current=17.226447258478334
color yellow, pair_05
distance pair_06, 1D0R and resi 11 and name CA, 1D0R and resi 20 and name CA  # target=15.957051986594163 current=17.19812324662534
color yellow, pair_06
distance pair_07, 1D0R and resi 6 and name CA, 1D0R and resi 22 and name CA  # target=24.141160087780417 current=25.27825470669517
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
