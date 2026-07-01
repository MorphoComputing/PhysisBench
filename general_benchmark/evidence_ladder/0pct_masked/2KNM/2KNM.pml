# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.016604314567918936

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+3+15+18+21+24+25+26+27+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 19 and name CA, 2KNM and resi 28 and name CA  # target=4.513047188598279 current=4.362432275292825
color yellow, pair_00
distance pair_01, 2KNM and resi 6 and name CA, 2KNM and resi 25 and name CA  # target=4.496937596271118 current=4.360878766419788
color yellow, pair_01
distance pair_02, 2KNM and resi 2 and name CA, 2KNM and resi 27 and name CA  # target=4.463734902469884 current=4.331634103650094
color yellow, pair_02
distance pair_03, 2KNM and resi 8 and name CA, 2KNM and resi 17 and name CA  # target=19.394316147278023 current=19.453560805294345
color yellow, pair_03
distance pair_04, 2KNM and resi 19 and name CA, 2KNM and resi 27 and name CA  # target=5.148819288730059 current=5.090680542486232
color yellow, pair_04
distance pair_05, 2KNM and resi 9 and name CA, 2KNM and resi 17 and name CA  # target=19.36688194784077 current=19.419980709938812
color yellow, pair_05
distance pair_06, 2KNM and resi 1 and name CA, 2KNM and resi 9 and name CA  # target=19.289528323751856 current=19.33859524884029
color yellow, pair_06
distance pair_07, 2KNM and resi 1 and name CA, 2KNM and resi 28 and name CA  # target=5.174770905714849 current=5.128314680845054
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
