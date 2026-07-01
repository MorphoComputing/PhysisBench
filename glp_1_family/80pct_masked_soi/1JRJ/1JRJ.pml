# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.0605669129224604

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 4+5+6+7+8+13+14+17+18+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1JRJ and resi 1 and name CA, 1JRJ and resi 28 and name CA  # target=47.495383948442374 current=46.09240797923241
color yellow, pair_00
distance pair_01, 1JRJ and resi 14 and name CA, 1JRJ and resi 28 and name CA  # target=21.72497962828868 current=20.5807047556673
color yellow, pair_01
distance pair_02, 1JRJ and resi 3 and name CA, 1JRJ and resi 18 and name CA  # target=26.259179010870653 current=25.24080309570676
color yellow, pair_02
distance pair_03, 1JRJ and resi 7 and name CA, 1JRJ and resi 23 and name CA  # target=25.899535399431077 current=25.008999935723825
color yellow, pair_03
distance pair_04, 1JRJ and resi 13 and name CA, 1JRJ and resi 25 and name CA  # target=19.085638417084034 current=18.245505642886403
color yellow, pair_04
distance pair_05, 1JRJ and resi 6 and name CA, 1JRJ and resi 26 and name CA  # target=31.375581331472425 current=30.55119043445118
color yellow, pair_05
distance pair_06, 1JRJ and resi 20 and name CA, 1JRJ and resi 30 and name CA  # target=13.645215384358234 current=12.830517640852518
color yellow, pair_06
distance pair_07, 1JRJ and resi 18 and name CA, 1JRJ and resi 35 and name CA  # target=14.639863456869683 current=13.827523901271437
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
