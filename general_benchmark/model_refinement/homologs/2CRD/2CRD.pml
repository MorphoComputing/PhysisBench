# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.1882689069107486

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 3+6+7+9+16+18+20+22+29+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CRD and resi 8 and name CA, 2CRD and resi 17 and name CA  # target=14.354368956661517 current=13.016647246735113
color yellow, pair_00
distance pair_01, 2CRD and resi 14 and name CA, 2CRD and resi 27 and name CA  # target=13.080893305098964 current=14.3282317130421
color yellow, pair_01
distance pair_02, 2CRD and resi 12 and name CA, 2CRD and resi 22 and name CA  # target=5.966422486394469 current=4.780847665717971
color yellow, pair_02
distance pair_03, 2CRD and resi 14 and name CA, 2CRD and resi 28 and name CA  # target=14.77569167993176 current=15.956828538713086
color yellow, pair_03
distance pair_04, 2CRD and resi 8 and name CA, 2CRD and resi 31 and name CA  # target=7.6135054826534025 current=6.470667930162724
color yellow, pair_04
distance pair_05, 2CRD and resi 8 and name CA, 2CRD and resi 18 and name CA  # target=14.174651315844415 current=13.03381421702475
color yellow, pair_05
distance pair_06, 2CRD and resi 20 and name CA, 2CRD and resi 28 and name CA  # target=21.233259443760986 current=22.355414035114123
color yellow, pair_06
distance pair_07, 2CRD and resi 2 and name CA, 2CRD and resi 15 and name CA  # target=12.108966374980838 current=10.99554983177266
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
