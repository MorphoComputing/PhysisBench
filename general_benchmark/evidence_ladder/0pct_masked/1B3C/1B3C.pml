# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.04507664495902625

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 7+15+35+42+57+58+59+60+61+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1B3C and resi 19 and name CA, 1B3C and resi 61 and name CA  # target=27.49512853859808 current=29.293925329600373
color yellow, pair_00
distance pair_01, 1B3C and resi 19 and name CA, 1B3C and resi 60 and name CA  # target=27.4926236814336 current=29.055971259326906
color yellow, pair_01
distance pair_02, 1B3C and resi 21 and name CA, 1B3C and resi 60 and name CA  # target=27.489961233427522 current=28.92141593797211
color yellow, pair_02
distance pair_03, 1B3C and resi 18 and name CA, 1B3C and resi 61 and name CA  # target=27.483944350391692 current=28.58905498997001
color yellow, pair_03
distance pair_04, 1B3C and resi 21 and name CA, 1B3C and resi 61 and name CA  # target=27.47814855220827 current=28.491474248158788
color yellow, pair_04
distance pair_05, 1B3C and resi 18 and name CA, 1B3C and resi 60 and name CA  # target=27.468106716741485 current=28.19782112353494
color yellow, pair_05
distance pair_06, 1B3C and resi 22 and name CA, 1B3C and resi 59 and name CA  # target=23.841827447568967 current=24.543547582483125
color yellow, pair_06
distance pair_07, 1B3C and resi 28 and name CA, 1B3C and resi 60 and name CA  # target=23.640918440132655 current=24.325682809920067
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
