# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5604180429855256

load 1D0R.pdb, 1D0R
bg_color white
hide everything, 1D0R
show cartoon, 1D0R
color grey80, 1D0R
set cartoon_transparency, 0.1

select worst_residues, 1D0R and resi 1+2+3+4+5+17+18+19+22+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1D0R and resi 1 and name CA, 1D0R and resi 25 and name CA  # target=37.44200054703274 current=36.13332650138884
color yellow, pair_00
distance pair_01, 1D0R and resi 3 and name CA, 1D0R and resi 24 and name CA  # target=32.34333750707119 current=31.421075711718167
color yellow, pair_01
distance pair_02, 1D0R and resi 2 and name CA, 1D0R and resi 23 and name CA  # target=31.661835803697656 current=30.774975562013196
color yellow, pair_02
distance pair_03, 1D0R and resi 5 and name CA, 1D0R and resi 28 and name CA  # target=37.20373173626808 current=36.365454912323585
color yellow, pair_03
distance pair_04, 1D0R and resi 2 and name CA, 1D0R and resi 28 and name CA  # target=37.344538629017094 current=36.60740849562683
color yellow, pair_04
distance pair_05, 1D0R and resi 6 and name CA, 1D0R and resi 28 and name CA  # target=32.79651174296954 current=33.52192554262813
color yellow, pair_05
distance pair_06, 1D0R and resi 4 and name CA, 1D0R and resi 19 and name CA  # target=27.029600958880167 current=26.31120051391756
color yellow, pair_06
distance pair_07, 1D0R and resi 4 and name CA, 1D0R and resi 27 and name CA  # target=37.450089617423465 current=36.73189301556576
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
