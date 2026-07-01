# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.19247674185221814

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 1+2+16+20+25+26+27+32+33+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1R1F and resi 17 and name CA, 1R1F and resi 26 and name CA  # target=21.750840604966147 current=22.086805811053075
color yellow, pair_00
distance pair_01, 1R1F and resi 9 and name CA, 1R1F and resi 35 and name CA  # target=22.950990372348706 current=23.249358104892703
color yellow, pair_01
distance pair_02, 1R1F and resi 1 and name CA, 1R1F and resi 23 and name CA  # target=10.106060408325217 current=10.396031099152086
color yellow, pair_02
distance pair_03, 1R1F and resi 22 and name CA, 1R1F and resi 30 and name CA  # target=4.128796027834688 current=3.86322186844615
color yellow, pair_03
distance pair_04, 1R1F and resi 1 and name CA, 1R1F and resi 22 and name CA  # target=8.307930377590804 current=8.54316371536397
color yellow, pair_04
distance pair_05, 1R1F and resi 6 and name CA, 1R1F and resi 25 and name CA  # target=8.511760404208996 current=8.736657814119486
color yellow, pair_05
distance pair_06, 1R1F and resi 2 and name CA, 1R1F and resi 34 and name CA  # target=10.18395104136468 current=9.963152047949567
color yellow, pair_06
distance pair_07, 1R1F and resi 7 and name CA, 1R1F and resi 34 and name CA  # target=22.623479664893903 current=22.82874667337054
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
