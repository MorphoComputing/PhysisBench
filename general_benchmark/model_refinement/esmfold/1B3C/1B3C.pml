# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.092608171156757

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 18+19+30+32+33+50+59+60+61+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1B3C and resi 18 and name CA, 1B3C and resi 60 and name CA  # target=27.39146212081672 current=29.751287585212634
color yellow, pair_00
distance pair_01, 1B3C and resi 21 and name CA, 1B3C and resi 60 and name CA  # target=27.263375509416054 current=29.183624990803768
color yellow, pair_01
distance pair_02, 1B3C and resi 18 and name CA, 1B3C and resi 59 and name CA  # target=27.250672187719132 current=29.017973932928783
color yellow, pair_02
distance pair_03, 1B3C and resi 21 and name CA, 1B3C and resi 59 and name CA  # target=26.848032821075897 current=28.08965700937463
color yellow, pair_03
distance pair_04, 1B3C and resi 5 and name CA, 1B3C and resi 62 and name CA  # target=11.956149067964622 current=10.748150201427405
color yellow, pair_04
distance pair_05, 1B3C and resi 5 and name CA, 1B3C and resi 60 and name CA  # target=13.275719909010043 current=12.084238341653588
color yellow, pair_05
distance pair_06, 1B3C and resi 19 and name CA, 1B3C and resi 60 and name CA  # target=26.948407542427415 current=28.11771335604724
color yellow, pair_06
distance pair_07, 1B3C and resi 4 and name CA, 1B3C and resi 56 and name CA  # target=6.573586204358901 current=5.465608134893414
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
