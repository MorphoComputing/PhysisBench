# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.281825982971977

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 3+14+19+22+23+24+25+26+27+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1R1F and resi 6 and name CA, 1R1F and resi 22 and name CA  # target=5.526827568351721 current=7.410555077052283
color yellow, pair_00
distance pair_01, 1R1F and resi 2 and name CA, 1R1F and resi 20 and name CA  # target=5.526827568351721 current=6.497050107915397
color yellow, pair_01
distance pair_02, 1R1F and resi 12 and name CA, 1R1F and resi 30 and name CA  # target=5.526827568351721 current=5.888997152953524
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
