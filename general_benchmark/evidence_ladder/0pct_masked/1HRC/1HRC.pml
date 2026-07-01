# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.06778117441234467

load 1HRC.pdb, 1HRC
bg_color white
hide everything, 1HRC
show cartoon, 1HRC
color grey80, 1HRC
set cartoon_transparency, 0.1

select worst_residues, 1HRC and resi 3+4+44+46+49+53+75+86+88+96
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HRC and resi 3 and name CA, 1HRC and resi 49 and name CA  # target=27.499997945438643 current=33.36048329535372
color yellow, pair_00
distance pair_01, 1HRC and resi 1 and name CA, 1HRC and resi 49 and name CA  # target=27.499997295024635 current=33.28147434000389
color yellow, pair_01
distance pair_02, 1HRC and resi 4 and name CA, 1HRC and resi 49 and name CA  # target=27.49999288912608 current=32.65556276816432
color yellow, pair_02
distance pair_03, 1HRC and resi 3 and name CA, 1HRC and resi 53 and name CA  # target=27.49998626689004 current=32.37020821476646
color yellow, pair_03
distance pair_04, 1HRC and resi 44 and name CA, 1HRC and resi 86 and name CA  # target=27.499981942778973 current=32.31098500166765
color yellow, pair_04
distance pair_05, 1HRC and resi 44 and name CA, 1HRC and resi 88 and name CA  # target=27.49997855035422 current=32.200325268831605
color yellow, pair_05
distance pair_06, 1HRC and resi 4 and name CA, 1HRC and resi 53 and name CA  # target=27.499960152499842 current=31.79364946211667
color yellow, pair_06
distance pair_07, 1HRC and resi 1 and name CA, 1HRC and resi 46 and name CA  # target=27.499956269820235 current=31.77243914690165
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
