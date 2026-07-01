# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4346546744472054

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 1+2+7+15+16+24+27+28+37+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1SHG and resi 4+9
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1SHG and resi 2 and name CA, 1SHG and resi 50 and name CA  # target=17.85534456475454 current=14.43402532825738
color yellow, pair_00
distance pair_01, 1SHG and resi 17 and name CA, 1SHG and resi 31 and name CA  # target=14.28784970301931 current=17.393682212247597
color yellow, pair_01
distance pair_02, 1SHG and resi 17 and name CA, 1SHG and resi 28 and name CA  # target=10.440886995185798 current=13.364984505404362
color yellow, pair_02
distance pair_03, 1SHG and resi 23 and name CA, 1SHG and resi 47 and name CA  # target=9.450761995761582 current=12.288829421767815
color yellow, pair_03
distance pair_04, 1SHG and resi 11 and name CA, 1SHG and resi 45 and name CA  # target=6.289337651249823 current=9.067058939732446
color yellow, pair_04
distance pair_05, 1SHG and resi 20 and name CA, 1SHG and resi 46 and name CA  # target=16.50927628083015 current=13.800320414647041
color yellow, pair_05
distance pair_06, 1SHG and resi 8 and name CA, 1SHG and resi 16 and name CA  # target=15.476320011534622 current=12.767686960021493
color yellow, pair_06
distance pair_07, 1SHG and resi 3 and name CA, 1SHG and resi 47 and name CA  # target=13.575578538257748 current=11.001827500410599
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
