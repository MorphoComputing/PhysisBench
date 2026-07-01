# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.424466446293773

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 1+2+3+10+11+17+24+25+26+29
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1OMB and resi 3 and name CA, 1OMB and resi 20 and name CA  # target=10.665838782807127 current=11.892747373517865
color yellow, pair_00
distance pair_01, 1OMB and resi 16 and name CA, 1OMB and resi 26 and name CA  # target=22.503307781540286 current=23.67830826292435
color yellow, pair_01
distance pair_02, 1OMB and resi 16 and name CA, 1OMB and resi 25 and name CA  # target=21.74423058456225 current=22.89801304043271
color yellow, pair_02
distance pair_03, 1OMB and resi 1 and name CA, 1OMB and resi 33 and name CA  # target=13.62929568204553 current=12.498768133671373
color yellow, pair_03
distance pair_04, 1OMB and resi 5 and name CA, 1OMB and resi 16 and name CA  # target=10.464071426978933 current=11.560984788229366
color yellow, pair_04
distance pair_05, 1OMB and resi 4 and name CA, 1OMB and resi 20 and name CA  # target=10.14959073716429 current=11.169749639348742
color yellow, pair_05
distance pair_06, 1OMB and resi 2 and name CA, 1OMB and resi 20 and name CA  # target=10.725204123491714 current=11.738875099393892
color yellow, pair_06
distance pair_07, 1OMB and resi 10 and name CA, 1OMB and resi 27 and name CA  # target=6.736378303066161 current=7.738015319438654
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
