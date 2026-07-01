# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.05705276868207615

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 1+2+3+4+6+7+17+28+29+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CRD and resi 17 and name CA, 2CRD and resi 28 and name CA  # target=21.48108554575627 current=21.632834308699127
color yellow, pair_00
distance pair_01, 2CRD and resi 7 and name CA, 2CRD and resi 20 and name CA  # target=20.691661106407498 current=20.837398981402895
color yellow, pair_01
distance pair_02, 2CRD and resi 24 and name CA, 2CRD and resi 33 and name CA  # target=4.425381041922848 current=4.302651314302028
color yellow, pair_02
distance pair_03, 2CRD and resi 4 and name CA, 2CRD and resi 30 and name CA  # target=4.332058319010956 current=4.228777610056904
color yellow, pair_03
distance pair_04, 2CRD and resi 17 and name CA, 2CRD and resi 29 and name CA  # target=20.429691932814926 current=20.526369825977902
color yellow, pair_04
distance pair_05, 2CRD and resi 4 and name CA, 2CRD and resi 31 and name CA  # target=5.24924770409616 current=5.163146475228409
color yellow, pair_05
distance pair_06, 2CRD and resi 1 and name CA, 2CRD and resi 31 and name CA  # target=6.588342803131534 current=6.509112161318027
color yellow, pair_06
distance pair_07, 2CRD and resi 6 and name CA, 2CRD and resi 29 and name CA  # target=10.693714158274819 current=10.769624384837096
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
