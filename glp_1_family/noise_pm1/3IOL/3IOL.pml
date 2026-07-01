# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.0298429009358372

load 3IOL.pdb, 3IOL
bg_color white
hide everything, 3IOL
show cartoon, 3IOL
color grey80, 3IOL
set cartoon_transparency, 0.1

select worst_residues, 3IOL and resi 1+5+6+7+9+12+19+21+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 3IOL and resi 4 and name CA, 3IOL and resi 20 and name CA  # target=21.396804942668638 current=23.85461345574346
color yellow, pair_00
distance pair_01, 3IOL and resi 6 and name CA, 3IOL and resi 22 and name CA  # target=21.958194709320132 current=24.285737811050627
color yellow, pair_01
distance pair_02, 3IOL and resi 7 and name CA, 3IOL and resi 22 and name CA  # target=21.124779332452654 current=23.23162662195486
color yellow, pair_02
distance pair_03, 3IOL and resi 3 and name CA, 3IOL and resi 22 and name CA  # target=31.068795127282474 current=29.275058091929274
color yellow, pair_03
distance pair_04, 3IOL and resi 1 and name CA, 3IOL and resi 18 and name CA  # target=23.271422178217776 current=25.054736709425807
color yellow, pair_04
distance pair_05, 3IOL and resi 8 and name CA, 3IOL and resi 24 and name CA  # target=22.300800367243504 current=24.023411725709575
color yellow, pair_05
distance pair_06, 3IOL and resi 5 and name CA, 3IOL and resi 15 and name CA  # target=18.042951433629085 current=16.32804651849605
color yellow, pair_06
distance pair_07, 3IOL and resi 10 and name CA, 3IOL and resi 22 and name CA  # target=20.099932836820166 current=18.402138385527604
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
