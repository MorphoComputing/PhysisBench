# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.0792867745328207

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 6+7+10+17+18+19+20+22+28+29
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CRD and resi 24 and name CA, 2CRD and resi 33 and name CA  # target=5.153238107462642 current=4.441219746465121
color yellow, pair_00
distance pair_01, 2CRD and resi 6 and name CA, 2CRD and resi 20 and name CA  # target=21.06648181184093 current=21.60038787121234
color yellow, pair_01
distance pair_02, 2CRD and resi 11 and name CA, 2CRD and resi 31 and name CA  # target=5.699241031896657 current=5.179435638372575
color yellow, pair_02
distance pair_03, 2CRD and resi 4 and name CA, 2CRD and resi 30 and name CA  # target=5.328852938967538 current=4.809379008904407
color yellow, pair_03
distance pair_04, 2CRD and resi 11 and name CA, 2CRD and resi 24 and name CA  # target=5.365696756449275 current=4.862432894885676
color yellow, pair_04
distance pair_05, 2CRD and resi 8 and name CA, 2CRD and resi 26 and name CA  # target=5.064159391703703 current=4.575791219737727
color yellow, pair_05
distance pair_06, 2CRD and resi 12 and name CA, 2CRD and resi 24 and name CA  # target=5.406059816369539 current=4.929186110139045
color yellow, pair_06
distance pair_07, 2CRD and resi 1 and name CA, 2CRD and resi 32 and name CA  # target=6.201184334192677 current=5.826567954144138
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
