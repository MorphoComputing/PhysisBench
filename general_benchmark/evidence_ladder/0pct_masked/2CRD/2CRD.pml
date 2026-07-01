# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.02343208549942103

load 2CRD.pdb, 2CRD
bg_color white
hide everything, 2CRD
show cartoon, 2CRD
color grey80, 2CRD
set cartoon_transparency, 0.1

select worst_residues, 2CRD and resi 1+2+4+7+16+20+24+27+28+29
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CRD and resi 20 and name CA, 2CRD and resi 28 and name CA  # target=23.114653648397024 current=23.532171716228344
color yellow, pair_00
distance pair_01, 2CRD and resi 6 and name CA, 2CRD and resi 20 and name CA  # target=22.377434324819966 current=22.59360351358107
color yellow, pair_01
distance pair_02, 2CRD and resi 20 and name CA, 2CRD and resi 29 and name CA  # target=22.228459389391904 current=22.4189328543067
color yellow, pair_02
distance pair_03, 2CRD and resi 17 and name CA, 2CRD and resi 28 and name CA  # target=21.48108554575627 current=21.670641220874014
color yellow, pair_03
distance pair_04, 2CRD and resi 19 and name CA, 2CRD and resi 28 and name CA  # target=21.35210960550115 current=21.52808447042814
color yellow, pair_04
distance pair_05, 2CRD and resi 7 and name CA, 2CRD and resi 20 and name CA  # target=20.691661106407498 current=20.86703063413157
color yellow, pair_05
distance pair_06, 2CRD and resi 4 and name CA, 2CRD and resi 30 and name CA  # target=4.332058319010956 current=4.1633833151393285
color yellow, pair_06
distance pair_07, 2CRD and resi 6 and name CA, 2CRD and resi 19 and name CA  # target=20.68513377242628 current=20.844274337816287
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
