# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.36232173862024564

load 1SN3.pdb, 1SN3
bg_color white
hide everything, 1SN3
show cartoon, 1SN3
color grey80, 1SN3
set cartoon_transparency, 0.1

select worst_residues, 1SN3 and resi 11+16+17+19+22+31+37+51+54+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SN3 and resi 18 and name CA, 1SN3 and resi 63 and name CA  # target=23.5 current=24.643756350861644
color yellow, pair_00
distance pair_01, 1SN3 and resi 19 and name CA, 1SN3 and resi 54 and name CA  # target=21.989808934413233 current=22.715689689361753
color yellow, pair_01
distance pair_02, 1SN3 and resi 22 and name CA, 1SN3 and resi 50 and name CA  # target=17.131444454528044 current=17.756521886336472
color yellow, pair_02
distance pair_03, 1SN3 and resi 20 and name CA, 1SN3 and resi 52 and name CA  # target=23.231551194853417 current=23.83135362490634
color yellow, pair_03
distance pair_04, 1SN3 and resi 40 and name CA, 1SN3 and resi 61 and name CA  # target=23.494805470698562 current=24.057978362577124
color yellow, pair_04
distance pair_05, 1SN3 and resi 23 and name CA, 1SN3 and resi 60 and name CA  # target=24.36510012861273 current=24.89985798182448
color yellow, pair_05
distance pair_06, 1SN3 and resi 18 and name CA, 1SN3 and resi 58 and name CA  # target=20.470680206630117 current=20.998157597324756
color yellow, pair_06
distance pair_07, 1SN3 and resi 15 and name CA, 1SN3 and resi 60 and name CA  # target=22.155002368988093 current=22.671412678582662
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
