# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.29100029695793117

load 3IOL.pdb, 3IOL
bg_color white
hide everything, 3IOL
show cartoon, 3IOL
color grey80, 3IOL
set cartoon_transparency, 0.1

select worst_residues, 3IOL and resi 1+2+3+17+18+20+21+22+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 3IOL and resi 4 and name CA, 3IOL and resi 23 and name CA  # target=27.78732867134071 current=28.733727648619777
color yellow, pair_00
distance pair_01, 3IOL and resi 2 and name CA, 3IOL and resi 21 and name CA  # target=27.726675265958928 current=28.568776071166845
color yellow, pair_01
distance pair_02, 3IOL and resi 2 and name CA, 3IOL and resi 22 and name CA  # target=31.504744834537608 current=30.679108121005083
color yellow, pair_02
distance pair_03, 3IOL and resi 3 and name CA, 3IOL and resi 22 and name CA  # target=28.444795081224527 current=29.252243638195914
color yellow, pair_03
distance pair_04, 3IOL and resi 3 and name CA, 3IOL and resi 24 and name CA  # target=31.9181309952657 current=31.11718064169479
color yellow, pair_04
distance pair_05, 3IOL and resi 2 and name CA, 3IOL and resi 23 and name CA  # target=32.17596927917813 current=31.440975160685298
color yellow, pair_05
distance pair_06, 3IOL and resi 1 and name CA, 3IOL and resi 21 and name CA  # target=27.63397188306877 current=28.326459846386026
color yellow, pair_06
distance pair_07, 3IOL and resi 1 and name CA, 3IOL and resi 24 and name CA  # target=32.16625508204472 current=31.523580471217787
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
