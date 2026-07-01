# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.621976764004364

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 5+13+15+20+22+23+24+25+27+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 11+13+19+28+41+107
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 6 and name CA, 1GB1 and resi 20 and name CA  # target=20.743984401437473 current=7.271301318507492
color yellow, pair_00
distance pair_01, 1GB1 and resi 9 and name CA, 1GB1 and resi 23 and name CA  # target=24.625598731667463 current=11.541526204956375
color yellow, pair_01
distance pair_02, 1GB1 and resi 12 and name CA, 1GB1 and resi 27 and name CA  # target=18.857750538478136 current=5.790616489983736
color yellow, pair_02
distance pair_03, 1GB1 and resi 12 and name CA, 1GB1 and resi 21 and name CA  # target=24.000650572986174 current=12.670709910940376
color yellow, pair_03
distance pair_04, 1GB1 and resi 11 and name CA, 1GB1 and resi 21 and name CA  # target=27.029206727573307 current=15.712709315293926
color yellow, pair_04
distance pair_05, 1GB1 and resi 12 and name CA, 1GB1 and resi 22 and name CA  # target=21.82776777170531 current=10.586493672481833
color yellow, pair_05
distance pair_06, 1GB1 and resi 14 and name CA, 1GB1 and resi 27 and name CA  # target=15.578924272468795 current=4.343147675183555
color yellow, pair_06
distance pair_07, 1GB1 and resi 11 and name CA, 1GB1 and resi 22 and name CA  # target=23.440621226190387 current=12.432865842777979
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
